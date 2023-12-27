import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class WasteBank {
  final String name;
  final String profile;

  WasteBank({required this.name, required this.profile});
}

class WasteBanklist extends StatelessWidget {
  final List<WasteBank> wasteBanks = [
    WasteBank(name: "Mawar Biru", profile: "lib/images/banksampah1.jpg"),
    WasteBank(name: "Dewi Sinta", profile: "lib/images/banksampah2.jpeg"),
    // Add more WasteBank objects as needed
  ];

  WasteBanklist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(wasteBanks.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(wasteBanks[index].profile),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bs. ${wasteBanks[index].name}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text("Jl.Kraton Tegal"),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        Ionicons.star,
                        color: Colors.yellow[700],
                        size: 18,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 4, right: 6),
                        child: Text(
                          "4.0",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text("195 Reviews"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
