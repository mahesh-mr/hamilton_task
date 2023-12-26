import 'dart:convert';
import 'dart:developer';

import 'dio_client/dio_client.dart';

class ApiService {
  static Future<dynamic> getMethod(String url) async {
    try {
      final responce = await DioClient.dio.get(url);
      var responceJson = json.decode(responce.data);
      if (responce.statusCode == 200 || responce.statusCode == 201) {
        log("msg : $responceJson ");
        return responceJson;
      } else {
        log("err msg : $responceJson ");
        return null;
      }
    } catch (e) {
      log("err catch msg : $e ");
      log("err catch msg : ");
      // return responceJson;
    }
  }
}
