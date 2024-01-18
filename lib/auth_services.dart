import 'package:capstone_ecogreen_mobile/egreen_service.dart';
import 'package:dio/dio.dart';

class AuthServices {
  static String? id;
  static String? nama;
  Future<bool> login(
      {required String? email, required String? password}) async {
    try {
      var response = await Dio().post(
        "${ApiConstants.baseurl}/loginmob",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "email": email,
          "password": password,
        },
      );
      Map obj = response.data;
      int id_int = obj["data"]["userid"];
      nama = obj["data"]["nama"];
      id = id_int.toString();
      print(obj);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
