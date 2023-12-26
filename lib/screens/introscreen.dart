import 'package:capstone_ecogreen_mobile/helper/colors.dart';
import 'package:capstone_ecogreen_mobile/widgets/backgroundcircle.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  bool _isContainerVisible = false;
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _updatesize();
    });
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      reverseDuration: Duration(seconds: 2),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) controller.reverse();
        if (status == AnimationStatus.dismissed) controller.forward();
      });
    controller.forward();
  }

  _updatesize() {
    setState(() {
      _isContainerVisible = true;
    });
  }

  void _redirectToLogin() {
    Navigator.pushReplacementNamed(context,
        '/login'); // Ganti '/login' dengan rute yang sesuai untuk halaman login Anda
  }

  @override
  Widget build(BuildContext context) {
    final res_width = MediaQuery.of(context).size.width;
    final res_height = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(211, 245, 191, 1),
      body: ListView(
        children: [
          SizedBox(
            height: res_height * 0.1,
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.easeOut,
            height: _isContainerVisible ? res_width * 0.9 : 0.0,
            width: _isContainerVisible ? res_width * 0.9 : 0.0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                BackgroundCircle(
                    circleBorderWidth: 80.0,
                    circleColor: Colors.grey,
                    circleOpacity: 0.1,
                    circleWidth: res_width * 0.9),
                BackgroundCircle(
                    circleBorderWidth: 40.0,
                    circleColor: Colors.grey,
                    circleOpacity: 0.2,
                    circleWidth: res_width * 0.8),
                SlideTransition(
                  position: Tween<Offset>(
                          begin: Offset(0, -0.15), end: Offset(0, 0.15))
                      .animate(controller),
                  child: Image.asset('lib/images/wasteuang.png'),
                )
              ],
            ),
          ),
          SizedBox(
            height: res_height * 0.1,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Text(
              "Cari tahu sampah yang kamu temukan. Untuk pemilahan yang cermat.",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .merge(TextStyle(color: Colors.grey)),
            ),
          ),
          SizedBox(
            height: res_height * 0.1,
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap:
                  _redirectToLogin, // Mengarahkan fungsi _redirectToLogin saat tombol ditekan
              child: Container(
                width: res_width * 0.32,
                decoration: BoxDecoration(
                  color: kprimarycolor,
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.restart_alt,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Restart",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .merge(TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
