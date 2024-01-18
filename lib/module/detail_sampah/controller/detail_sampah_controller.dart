import 'package:flutter/material.dart';
import '../view/detail_sampah_view.dart';

class DetailSampahController extends State<DetailSampahView> {
  static late DetailSampahController instance;
  late DetailSampahView view;

  String? nama;
  String? jenis;

  @override
  void initState() {
    instance = this;
    if (widget.item != null) {
      nama = widget.item!["nama"];
      jenis = widget.item!["jenis"];
    }
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
