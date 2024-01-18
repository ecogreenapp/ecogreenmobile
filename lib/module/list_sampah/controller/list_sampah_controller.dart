import 'package:capstone_ecogreen_mobile/egreen_service.dart';
import 'package:flutter/material.dart';
import '../view/list_sampah_view.dart';

class ListSampahController extends State<ListSampahView> {
  static late ListSampahController instance;
  late ListSampahView view;

  @override
  void initState() {
    instance = this;
    getSampah();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List sampah = [];
  getSampah() async {
    sampah = await EgreenService().get();
    print(sampah);
    setState(() {});
  }
}
