import 'package:capstone_ecogreen_mobile/core.dart';
import 'package:capstone_ecogreen_mobile/helper/colors.dart';
import 'package:capstone_ecogreen_mobile/screens/introscreen.dart';
import 'package:capstone_ecogreen_mobile/widgets/backgroundcircle.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:slide_to_act/slide_to_act.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted>
    with SingleTickerProviderStateMixin {
  final _player = AudioPlayer();

  bool _isContainerVisible = false;
  Offset offset = const Offset(120, 0);
  final double height = 200;
  final double width = 200;
  bool charactermoving = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _updateSize();
    });
  }

  void _updateSize() {
    setState(() {
      _isContainerVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final res_width = MediaQuery.of(context).size.width;
    final res_height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 217, 175, 1),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Eco Green.",
              style: Theme.of(context).textTheme.headline2!.merge(
                    TextStyle(
                      color: Colors.white,
                      fontFamily: 'Outfit',
                      fontSize: 33, // Ukuran font disesuaikan
                    ),
                  ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Memelihara Lingkungan\nsejatinya memelihara kehidupan.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.merge(
                    TextStyle(
                      color: Color.fromARGB(255, 178, 176, 176),
                      fontFamily: 'Outfit',
                      fontSize: 20, // Ukuran font disesuaikan
                    ),
                  ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: _isContainerVisible ? res_height * 0.5 : 0.0,
            width: _isContainerVisible ? res_width * 0.9 : 0.0,
            curve: Curves.easeOut,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  right: offset.dx - (width / 2),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      BackgroundCircle(
                        circleWidth: res_width * 0.9,
                        circleBorderWidth: 80.0,
                        circleOpacity: 0.2,
                        circleColor: Colors.white,
                      ),
                      BackgroundCircle(
                        circleWidth: res_width * 0.8,
                        circleBorderWidth: 40.0,
                        circleOpacity: 0.3,
                        circleColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onPanUpdate: (details) {
                    RenderBox getBox = context.findRenderObject() as RenderBox;
                    setState(() {
                      offset = getBox.localToGlobal(details.globalPosition);
                      charactermoving = true;
                    });
                  },
                  onPanEnd: (details) {
                    setState(() {
                      offset = const Offset(120, 0);
                      charactermoving = false;
                    });
                  },
                  child: SizedBox(
                    height: res_height * 0.5,
                    child: Stack(
                      children: <Widget>[
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeOut,
                          left: offset.dx - (width / 2),
                          child: SizedBox(
                            width: res_width * 0.9,
                            height: res_height * 0.5,
                            child: Image.asset(
                              'lib/images/trashorg.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onPanUpdate: (details) {
              RenderBox getBox = context.findRenderObject() as RenderBox;
              setState(() {
                offset = getBox.localToGlobal(details.globalPosition);
                charactermoving = true;
              });
            },
            onPanEnd: (details) {
              setState(() {
                offset = const Offset(120, 0);
                charactermoving = false;
              });
            },
            child: SizedBox(
              height: 30,
              child: !charactermoving
                  ? Image.asset(
                      'lib/images/two-arrows.png',
                      color: Colors.white,
                    )
                  : const SizedBox(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Builder(
            builder: (context) {
              final GlobalKey<SlideActionState> _key = GlobalKey();
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: res_width * 0.8,
                  child: SlideAction(
                    text: "Get Started",
                    textStyle: Theme.of(context).textTheme.headline6!.merge(
                          TextStyle(
                            color: Color.fromARGB(255, 105, 191, 81),
                            fontFamily: 'Outfit',
                          ),
                        ),
                    key: _key,
                    onSubmit: () async {
                      // await _player.setAsset('assets/audio/chimeup.mp3');
                      // _player.play();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginMobileView(),
                        ),
                      );
                    },
                    innerColor: Color.fromARGB(255, 189, 241, 175),
                    outerColor: Colors.white,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
