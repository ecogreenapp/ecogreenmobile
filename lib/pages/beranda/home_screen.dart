import 'package:capstone_ecogreen_mobile/widgets/ecogreen_menu.dart';
import 'package:capstone_ecogreen_mobile/widgets/upcoming_card.dart';
import 'package:capstone_ecogreen_mobile/widgets/wastebank.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // name
                        Text(
                          'Hello',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 8),
                        // Text(
                        //   "Hasnita Ran",
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 20,
                        //   ),
                        // ),
                        Text(
                          user.email!,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),

                    // // profile picture
                    // Container(
                    //   padding: EdgeInsets.all(10),
                    //   child: Icon(Icons.person),
                    // ),
                  ],
                ),
              )
            ],
          ),
          actions: [
            IconButton(
              onPressed: signUserOut,
              icon: Icon(Icons.logout),
            )
          ]
          // actions: [
          //   IconButton(
          //     onPressed: () {},
          //     icon: const Icon(Ionicons.notifications_outline),
          //   ),
          //   IconButton(
          //     onPressed: () {},
          //     icon: const Icon(Ionicons.search_outline),
          //   ),
          // ],
          ),
      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          // upcoming card
          SizedBox(height: 25),
          const UpcomingCard(),
          SizedBox(height: 20),
          Text(
            "Ecogreen Menu",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 15),
          // EcoGreen Menu
          const EcogreenMenu(),
          const SizedBox(height: 25),
          Text(
            "Bank Sampah",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 15),
          WasteBanklist(),

          // ecogreen menu

          // neraby waste bank
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Ionicons.home_outline), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Ionicons.calendar_outline), label: "Calendar"),
          BottomNavigationBarItem(
              icon: Icon(Ionicons.chatbubble_ellipses_outline), label: "Chats"),
          BottomNavigationBarItem(
              icon: Icon(Ionicons.person_outline), label: "Profile"),
        ],
      ),
    );
  }
}
