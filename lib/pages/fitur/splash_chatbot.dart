// splash_screen.dart

import 'dart:async';
import 'package:capstone_ecogreen_mobile/pages/fitur/chatbotpage.dart';
import 'package:flutter/material.dart'; // Pastikan sesuaikan dengan nama file dan class chatbot Anda

class SplashChatbot extends StatefulWidget {
  const SplashChatbot({Key? key}) : super(key: key);

  @override
  _SplashChatbotState createState() => _SplashChatbotState();
}

class _SplashChatbotState extends State<SplashChatbot> {
  @override
  void initState() {
    super.initState();

    // Tambahkan timer untuk mengarahkan ke halaman ChatbotPage setelah beberapa detik
    Timer(
      Duration(seconds: 3), // Sesuaikan durasi splash screen sesuai kebutuhan
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChatbotScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Mengganti teks dengan gambar
        child: Image.asset(
          'lib/images/wedec-body.png', // Sesuaikan path dengan lokasi gambar Anda
          width: 200, // Sesuaikan ukuran gambar sesuai kebutuhan
          height: 200,
        ),
      ),
    );
  }
}
