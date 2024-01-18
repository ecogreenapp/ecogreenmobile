import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_mobile_controller.dart';

class LoginMobileView extends StatefulWidget {
  const LoginMobileView({Key? key}) : super(key: key);

  Widget build(context, LoginMobileController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ecogreen Mobile"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 20,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    suffixIcon: Icon(
                      Icons.email,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: 'Enter your email address',
                  ),
                  onChanged: (value) {
                    controller.email = value;
                  },
                ),
                TextFormField(
                  maxLength: 20,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    suffixIcon: Icon(
                      Icons.password,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: 'Enter your password',
                  ),
                  onChanged: (value) {
                    controller.password = value;
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(0, 185, 142, 1),
                  ),
                  onPressed: () => controller.doLogin(),
                  child: const Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<LoginMobileView> createState() => LoginMobileController();
}
