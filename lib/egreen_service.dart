import 'package:capstone_ecogreen_mobile/auth_services.dart';
import 'package:dio/dio.dart';

class ApiConstants {
  static String baseurl = "https://1483-114-79-16-147.ngrok-free.app";
}

class EgreenService {
  Future<List> get() async {
    var response = await Dio().get(
      "${ApiConstants.baseurl}/sampahua",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    return obj["sampah"];
  }

  Future<List> getHistory() async {
    var response = await Dio().get(
      "${ApiConstants.baseurl}/historymob/${AuthServices.id}",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    return obj["history_mobile"];
  }
}
