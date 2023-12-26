import 'package:get/get.dart';

import '../../model/login_model.dart';
import '../../model/profile_model.dart';
import '../services/profile_service.dart';

class ProfileController extends GetxController {
  RxBool loding = true.obs;
  RxList<Profile> profile = <Profile>[].obs;
  //LoginModel loginModel = LoginModel();

  Future<List<Profile>?> getProfileService() async {
    try {
      var data = await ProfileService.profile();

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
