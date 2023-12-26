import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/login_model.dart';
import '../../model/profile_model.dart';
import 'dio_client/dio_client.dart';

class ProfileServices {
  //LoginModel loginModel = LoginModel();
  static Future<List<Profiles>?> profile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //  SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String tk =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuZXdVc2VyIjp7ImNsaWVudF9uYW1lIjoicG9pIiwibWFpbCI6InBvQGdtYWlsLmNvbSIsImNvdW50cnkiOjEsImNsaWVudF9zdGF0dXMiOnRydWUsImNsaWVudF9waG9uZSI6IjIzMTU2NDg5NzAiLCJjbGllbnRfZ2VuZGVyIjowLCJjbGllbnRfaWQiOjIwMjQ4NTN9LCJpYXQiOjE3MDM1ODM3MjF9.k_9tHgj-nZmGsNo9OjCR3hDIC3A_s-K1ef821iZ8P30";
    int? uid = prefs.getInt('clientId');
    print("id : $uid");
    print("tk : $token");
    try {
      var response = await DioClient.dio.get(
        'profiles/get-profiles?ClientID=2024853&userid=2024853',
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      print("res : ${response.data}");
      ProfileModels profileModel = ProfileModels.fromJson(response.data);
      // print("uid : $uid");
      //  String name =profileModel.data![0].clientName ;
      print("name : ${profileModel.data![0].clientName}");
      return profileModel.data;
    } on DioError catch (e) {
      print("6656566565656556565  dist");
      print("${e.response!.data}===========");
      print("${e.message}=fdsfg=fd");
    } catch (e) {
      print("$e");
    }
    return null;
  }
}