import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hamilton_task/controller/services/dio_client/dio_client.dart';
import 'package:hamilton_task/view/const/const.dart';
import 'package:hamilton_task/view/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/login_model.dart';

class LoginService {
  static Future<String?> LoginScreen({
    required String phoneNo,
    required String password,
  }) async {
    try {
      var responce = await DioClient.dio.post("auth/login", data: {
        "phone_number": phoneNo,
        "password": password,
      });
      print(responce.data);
      if (responce != null) {
        LoginModel loginModel = LoginModel.fromJson(responce.data);
      }
print("object : ${responce.data['user']['client_id']}");
      SharedPreferences prefs = await SharedPreferences.getInstance();
       // SharedPreferences pref = await SharedPreferences.getInstance();

   //   prefs.setString("token", responce.data['token']);
      prefs.setInt('clientId', responce.data['user']['client_id']);

    // final id =  prefs.getString('client_id');
    // print("idss : $id");

      // SharedPreferences prefs = await SharedPreferences.getInstance();

      // prefs.setString("token", responce.data['token']);
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      Get.snackbar(
        'Warning',
        e.message!,
        backgroundColor: appBackground,
      );
    } catch (e) {
      log("catch called $e");
    }
    return null;
  }
}
