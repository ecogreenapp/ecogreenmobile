import 'package:capstone_ecogreen_mobile/pages/login/login_page.dart';
import 'package:capstone_ecogreen_mobile/screens/getstarted.dart';
import 'package:capstone_ecogreen_mobile/screens/introscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntroSplash extends StatefulWidget {
  const IntroSplash({super.key});

  @override
  State<IntroSplash> createState() => _IntroSplashState();
}

class _IntroSplashState extends State<IntroSplash>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => GetStarted(),
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(253, 247, 242, 1),
              Color.fromRGBO(231, 212, 197, 1)
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Image.asset(
            'lib/images/newlogo.png', // Sesuaikan path dengan lokasi gambar Anda
            width: 300, // Sesuaikan ukuran gambar sesuai kebutuhan
            height: 300,
          ),
        ),
      ),
    );
  }
}
