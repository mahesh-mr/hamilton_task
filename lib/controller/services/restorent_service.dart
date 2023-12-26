import 'package:dio/dio.dart';
import 'package:hamilton_task/model/restorent_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/login_model.dart';
import '../../model/profile_model.dart';
import 'dio_client/dio_client.dart';

class RestorentService {
  //ProfileModel loginModel = ProfileModel();
  static Future<List<Restorent>?> restorent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //  SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? country = prefs.getString('country');
    print("id : $country");
    try {
      var response = await DioClient.dio.get(
        'mainpages/get-restaurants?PickupAvailable=1&AreaName=$country&page=1&page limit=10',
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      print("res : ${response.data}");
      RestorentModel restorentModel = RestorentModel.fromJson(response.data);
      print("uid : $country");
      print(restorentModel.data![0].nameAr);
      return restorentModel.data;
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
