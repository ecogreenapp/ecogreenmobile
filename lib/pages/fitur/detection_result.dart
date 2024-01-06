import 'dart:io';  // Import Dart:io, bukan Dart:html
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';


class DetectionResultPage extends StatefulWidget {
  final String detectionResult;

  const DetectionResultPage({Key? key, required this.detectionResult})
      : super(key: key);

  @override
  State<DetectionResultPage> createState() => _DetectionResultPageState();
}

class _DetectionResultPageState extends State<DetectionResultPage> {
  File? imageFile;
  final imagePicker = ImagePicker();


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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detection Result'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hasil Deteksi:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                widget.detectionResult,
                style: TextStyle(fontSize: 16, color: Colors.green),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Kembali ke halaman sebelumnya
                },
                child: const Text('Kembali'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
