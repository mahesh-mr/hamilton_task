import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/login_model.dart';
import '../../model/profile_model.dart';
import 'dio_client/dio_client.dart';

class ProfileService {
  //LoginModel loginModel = LoginModel();
  static Future<List<Profile>?> profile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     //  SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    int? uid = prefs.getInt('clientId');
    print("id : $uid");
    try {
      var response = await DioClient.dio.get(
        'profiles/get-profiles?ClientID=$uid&userid==$uid',
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      print("res : ${response.data}");
      ProfileModel profileModel = ProfileModel.fromJson(response.data);
      print("uid : $uid");
      print(profileModel);
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
