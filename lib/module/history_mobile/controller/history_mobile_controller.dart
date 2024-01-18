import 'package:capstone_ecogreen_mobile/egreen_service.dart';
import 'package:flutter/material.dart';
import '../view/history_mobile_view.dart';

class HistoryMobileController extends State<HistoryMobileView> {
  static late HistoryMobileController instance;
  late HistoryMobileView view;

  @override
  void initState() {
    instance = this;
    getHistoryMob();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List history = [];
  getHistoryMob() async {
    history = await EgreenService().getHistory();
    print(history);
    setState(() {});
  }
}
