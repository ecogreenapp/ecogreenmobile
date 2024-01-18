import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hama Caisim Prediction',
      theme: ThemeData(),
      home: const DetectionPageNew(),
    );
  }
}

class DetectionPageNew extends StatefulWidget {
  const DetectionPageNew({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<DetectionPageNew> {
  File? _file;
  String? prediction = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 71, 69, 0.8),
      appBar: AppBar(
        title: const Text('Hama Caisim Prediction'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.green, Colors.teal],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildImagePreview(),
                const SizedBox(height: 16),
                _buildPredictionText(),
                const SizedBox(height: 16),
                _buildButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImagePreview() {
    return _file == null
        ? Container(
            height: 200,
            width: 200,
            color: Colors.grey[300],
            child: const Center(
              child: Icon(
                Icons.photo,
                size: 50,
                color: Colors.grey,
              ),
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(
              _file!,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          );
  }

  Widget _buildPredictionText() {
    String formattedPrediction = _formatPrediction(prediction);

    return Text(
      formattedPrediction,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.white,
      ),
    );
  }

  String _formatPrediction(String? jsonPrediction) {
    if (jsonPrediction == null) {
      return "No prediction available";
    }

    try {
      Map<String, dynamic> predictionMap = jsonDecode(jsonPrediction);
      String result = predictionMap["label"];
      String confidence = predictionMap["accuracy"];
      return "Prediction: $result\nConfidence: $confidence";
    } catch (e) {
      return "";
    }
  }

  Widget _buildButtons() {
    return Column(
      children: <Widget>[
        ElevatedButton.icon(
          onPressed: () => uploadImage(),
          icon: const Icon(FontAwesomeIcons.upload),
          label: const Text("Upload Image"),
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: () async {
            await predict();
            print("Prediction Result: $prediction");
          },
          icon: const Icon(FontAwesomeIcons.wandMagic),
          label: const Text("Predict"),
        ),
      ],
    );
  }

  Future<void> uploadImage() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (myfile == null) return;

    setState(() {
      _file = File(myfile.path);
      prediction = "";
    });
  }

  Future<void> predict() async {
    if (_file == null) return;

    var uri =
        Uri.parse("https://b418-103-166-147-253.ngrok-free.app/predict_baru");

    var request = http.MultipartRequest("POST", uri);
    var multipartFile = http.MultipartFile(
      'file',
      http.ByteStream(Stream.castFrom(_file!.openRead())),
      _file!.lengthSync(),
      filename: _file!.path.split("/").last,
      contentType: MediaType('image', 'jpeg'),
    );

    request.files.add(multipartFile);

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        setState(() {
          prediction = responseBody;
        });
      } else {
        print("Image upload failed.");
      }
    } catch (e) {
      print("Error uploading image: $e");
    }
  }
}
