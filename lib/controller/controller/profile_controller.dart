import 'package:get/get.dart';

import '../../model/login_model.dart';
import '../../model/profile_model.dart';
import '../services/profile_service.dart';


class ProfilesController extends GetxController {
  RxBool loding = true.obs;
  RxList<Profiles> profile = <Profiles>[].obs;
  //LoginModel loginModel = LoginModel();

  Future<List<Profiles>?> getProfileService() async {
    try {
      var data = await ProfileServices.profile();

      loding.value = false;
      return data;
    } catch (e) {
      Get.snackbar('warnig', 'Please check Internet Connection');
      print(e);
      print('catch bloc called');
      loding.value = false;
    }
    return null;
  }

  @override
  void onInit() {
    getProfileService().then((value) => profile.value = value!);
    update();
    super.onInit();
  }
}