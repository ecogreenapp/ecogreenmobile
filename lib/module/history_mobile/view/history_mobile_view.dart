import 'package:flutter/material.dart';
import '../controller/history_mobile_controller.dart';

class HistoryMobileView extends StatefulWidget {
  const HistoryMobileView({Key? key}) : super(key: key);

  Widget build(context, HistoryMobileController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("HistoryMobile"),
        actions: const [],
      ),
      body: ListView.builder(
        itemCount: controller.history.length,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var item = controller.history[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[200],
                backgroundImage: const NetworkImage(
                  "https://i.ibb.co/QrTHd59/woman.jpg",
                ),
              ),
              title: Text(item["hasil"]),
              subtitle: Text(item["tanggal"]),
            ),
          );
        },
      ),
    );
  }

  @override
  State<HistoryMobileView> createState() => HistoryMobileController();
}
