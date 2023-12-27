import 'package:capstone_ecogreen_mobile/pages/auth_page.dart';
import 'package:capstone_ecogreen_mobile/pages/beranda/home_screen.dart';
import 'package:capstone_ecogreen_mobile/screens/introscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ecogreen_mobile/pages/intro_splash.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorSchemeSeed: const Color.fromRGBO(0, 185, 142, 1),
          textTheme:
              GoogleFonts.plusJakartaSansTextTheme(Theme.of(context).textTheme),
          useMaterial3: true),
      home: const IntroSplash(),
      routes: {
        '/login': (context) => const AuthPage(),
      },
    );
  }
}
