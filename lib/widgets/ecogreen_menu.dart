import 'package:capstone_ecogreen_mobile/module/list_sampah/view/list_sampah_view.dart';
import 'package:capstone_ecogreen_mobile/pages/fitur/detect_page.dart';
import 'package:capstone_ecogreen_mobile/pages/fitur/splash_chatbot.dart';
import 'package:flutter/material.dart';

class EcogreenMenu extends StatelessWidget {
  const EcogreenMenu({Key? key}) : super(key: key);

  // Function to handle the tap on the "Detection" icon
  void _onDetectionTap(BuildContext context) {
    // Implement the logic to navigate to the "Detection" page
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetectionPage()));
  }

  // Function to handle the tap on the "Education" icon
  void _onEducationTap(BuildContext context) {
    // Implement the logic to navigate to the "Education" page
    Example:
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ListSampahView()));
  }

  // Function to handle the tap on the "Green Bot" icon
  void _onGreenBotTap(BuildContext context) {
    // Implement the logic to navigate to the "Green Bot" page
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SplashChatbot()));
  }

  // Function to handle the tap on the "More" icon
  void _onMoreTap(BuildContext context) {
    // Implement the logic to navigate to the "More" page
    // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => MorePage()));
  }

  @override
  Widget build(BuildContext context) {
    List<CustomIcon> customIcons = [
      CustomIcon(
          name: "Detection",
          icon: 'lib/images/lup.png',
          onTap: _onDetectionTap),
      CustomIcon(
          name: "Education",
          icon: 'lib/images/book.png',
          onTap: _onEducationTap),
      CustomIcon(
          name: "Green Bot",
          icon: 'lib/images/wedec-head.png',
          onTap: _onGreenBotTap),
      CustomIcon(name: "More", icon: 'lib/images/more.png', onTap: _onMoreTap),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(customIcons.length, (index) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                customIcons[index].onTap(context);
              },
              borderRadius: BorderRadius.circular(90),
              child: Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.4),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  customIcons[index].icon,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(customIcons[index].name)
          ],
        );
      }),
    );
  }
}

class CustomIcon {
  final String name;
  final String icon;
  final Function(BuildContext context) onTap;

  CustomIcon({
    required this.name,
    required this.icon,
    required this.onTap,
  });
}
