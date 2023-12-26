import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hamilton_task/controller/services/dio_client/dio_client.dart';
import 'package:hamilton_task/view/const/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterService {
  static Future<String?> registerUser({
    required String name,
    required String email,
    required String phoneNo,
    required String password,
    required String country,
    required String userName,
  }) async {
    try {
      var responce = await DioClient.dio.post("auth/SignUp", data: {
        "Name": name,
        "Email": email,
        "phone_number": phoneNo,
        "Password": password,
        "Country": country,
        "UserName": userName
      });
      print("${responce.data}");
      // SharedPreferences prefs = await SharedPreferences.getInstance();

      // prefs.setString("token", responce.data['token']);

      // ignore: deprecated_member_use
    } catch (e) {
      log("catch called $e");
    }
    return null;
  }
}
