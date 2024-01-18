import 'dart:io';
import 'package:capstone_ecogreen_mobile/auth_services.dart';
import 'package:capstone_ecogreen_mobile/egreen_service.dart';
import 'package:dio/dio.dart' as dio; // Import dio with an alias
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get_connect/http/src/response/response.dart'
    as getResponse; // Import get Response with an alias

class DetectionPage extends StatefulWidget {
  const DetectionPage({Key? key}) : super(key: key);

  @override
  State<DetectionPage> createState() => _DetectionPageState();
}

class _DetectionPageState extends State<DetectionPage> {
  File? pickedImage;
  String detectionResult = '';
  bool isImageUploaded = false;

  File? imageFile;
  final imagePicker = ImagePicker();

  Future<void> sendJsonToFlask() async {
    String? Stress;
    if (imageFile == null) {
      print('File gambar belum dipilih.');
      return;
    }

    String? fileName = imageFile?.path.split('/').last;
    if (fileName == null) {
      print('Gagal mendapatkan nama file.');
      return;
    }

    String apiUrl = "${ApiConstants.baseurl}/receive_json";
    dio.Dio dioInstance = dio.Dio(); // Use the dio alias

    try {
      // Menggunakan opsi `data` untuk mengirim data dalam format JSON
      dio.Response response = await dioInstance.post(
        apiUrl,
        data: {
          'text': fileName,
          'userid': '${AuthServices.id}'
        }, // Kirim data teks sebagai payload JSON
      );

      // Periksa apakah respons server sukses
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        String message = responseData['result'];

        // if (message == 'sukses') {
        //   print('Sukses menerima teks JSON dari Flask $message');
        // } else {
        //   print('Gagal menerima teks JSON dari Flask');
        // }
        // print("Setres " + message);
        _showAlertDialog(context, 'Jenis Sampah', '$message');
      } else {
        print('Permintaan gagal. Kode respons: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during request: $e');
    }
  }

  Future<void> uploadFileImage() async {
    File imageFileUpload = File(imageFile!.path);
    String? fileName = imageFile?.path.split('/').last;

    String uploadEndpoint = "${ApiConstants.baseurl}/uploadFileAndroid";
    dio.Dio dioInstance = dio.Dio();

    dio.FormData formData = dio.FormData.fromMap({
      'file':
          await dio.MultipartFile.fromFile(imageFile!.path, filename: fileName),
    });

    try {
      dio.Response response =
          await dioInstance.post(uploadEndpoint, data: formData);
      if (response.data == 'sukses') {
        print('Upload berhasil: ${response.data}');
      } else {
        print('${response.data}');
      }
    } catch (e) {
      print('Error saat mengunggah: $e');
    }
  }

  Future<void> predict() async {
    uploadFileImage();
    sendJsonToFlask();
  }

  Future<void> showPictureDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select Action'),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  getFromCamera();
                  Navigator.of(context).pop();
                },
                child: const Text('Open Camera'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  getFromGallery();
                  Navigator.of(context).pop();
                },
                child: const Text('Open Gallery'),
              ),
            ],
          );
        });
  }

  void _showAlertDialog(BuildContext context, String title, String content) {
    // Membuat AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // Tutup alert
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );

    // Menampilkan AlertDialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  getFromGallery() async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  getFromCamera() async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: const Color.fromARGB(255, 207, 216, 214),
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(0, 185, 142, 1),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(0, 185, 142, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(0, 185, 142, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        imageFile = tempImage;
        isImageUploaded = true;
        detectionResult =
            'Deteksi sampah berhasil!\n\nSampah Botol Plastik dengan akurasi 85%\n\nMenu:\n- Harga Jual: Rp 5000/kg\n- Lokasi Bank Sampah: Jl. Bank Sampah No. 123\n- Kontak Bank Sampah: 081234567890';
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('WASTE DETECTION'),
        backgroundColor: const Color.fromRGBO(0, 185, 142, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(
                    "Foto Sampah",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Arahkan kamera pada objek sampah yang akan di deteksi",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 196, 206, 198),
                          width: 5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: ClipRRect(
                      child: imageFile != null
                          ? Image.file(
                              imageFile!,
                              width: 270,
                              height: 200,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              'https://previews.123rf.com/images/yupiramos/yupiramos1907/yupiramos190749458/127189627-plastic-and-disposables-products-garbage-vector-illustration-design.jpg',
                              width: 270,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 5,
                    child: IconButton(
                      onPressed: imagePickerOption,
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                        color: Color.fromRGBO(0, 185, 142, 1),
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ElevatedButton.icon(
            //     onPressed: imagePickerOption,
            //     icon: const Icon(Icons.add_a_photo_sharp),
            //     label: const Text('UPLOAD IMAGE'),
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: const Color.fromRGBO(0, 185, 142, 1)),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: showPictureDialog,
                icon: const Icon(Icons.add_a_photo_sharp),
                label: const Text('CHOOSE IMAGE'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(0, 185, 142, 1)),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ElevatedButton.icon(
            //     onPressed: uploadFileImage,
            //     icon: const Icon(Icons.add_a_photo_sharp),
            //     label: const Text('UPLOAD IMAGE'),
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: const Color.fromRGBO(0, 185, 142, 1)),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: predict,
                icon: const Icon(Icons.add_a_photo_sharp),
                label: const Text('PREDICT'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(0, 185, 142, 1)),
              ),
            ),
            const SizedBox(height: 20),
            if (isImageUploaded)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      "Hasil Deteksi",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      detectionResult,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
