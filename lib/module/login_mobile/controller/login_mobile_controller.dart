import 'package:capstone_ecogreen_mobile/auth_services.dart';
import 'package:capstone_ecogreen_mobile/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/login_mobile_view.dart';

class LoginMobileController extends State<LoginMobileView> {
  static late LoginMobileController instance;
  late LoginMobileView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  doLogin() async {
    bool isSuccess =
        await AuthServices().login(email: email!, password: password!);

    if (!isSuccess) {
      _showAlertDialog(context, "error", "content");
      return;
    }

    Get.offAll(HomeScreen());
  }
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
