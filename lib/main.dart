import 'package:capstone_ecogreen_mobile/core.dart';
import 'package:capstone_ecogreen_mobile/pages/fitur/detection_page_new.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroSplash(),
    ),
  );
}
