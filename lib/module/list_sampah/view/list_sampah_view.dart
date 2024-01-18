import 'package:capstone_ecogreen_mobile/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/list_sampah_controller.dart';

class ListSampahView extends StatefulWidget {
  const ListSampahView({Key? key}) : super(key: key);

  Widget build(context, ListSampahController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListSampah"),
        actions: const [],
      ),
      body: ListView.builder(
        itemCount: controller.sampah.length,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var item = controller.sampah[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[200],
                backgroundImage: NetworkImage(
                    "https://res.cloudinary.com/dohsfgda5/image/upload/v1705245887/q2y4vlkasg6b9lhunid0.jpg"),
              ),
              title: Text(item["nama"]),
              subtitle: Text(item["jenis"]),
              onTap: () async {
                await Get.to(DetailSampahView(
                  item: item,
                ));
                controller.getSampah();
              },
            ),
          );
        },
      ),
    );
  }

  @override
  State<ListSampahView> createState() => ListSampahController();
}
