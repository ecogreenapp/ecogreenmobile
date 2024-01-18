import 'package:flutter/material.dart';
import '../controller/detail_sampah_controller.dart';

class DetailSampahView extends StatefulWidget {
  final Map? item;
  const DetailSampahView({Key? key, this.item}) : super(key: key);

  Widget build(context, DetailSampahController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("DetailSampah"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                item!["nama"],
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Text(
                item!["jenis"],
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Text(
                "${item!["harga"]}",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<DetailSampahView> createState() => DetailSampahController();
}
