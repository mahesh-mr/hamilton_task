import 'package:get/get.dart';

import '../../model/login_model.dart';
import '../../model/profile_model.dart';
import '../../model/restorent_model.dart';
import '../services/profile_service.dart';
import '../services/restorent_service.dart';

class RestorentController extends GetxController {
  RxBool loding = true.obs;
  RxList<Restorent> restorent = <Restorent>[].obs;
  //LoginModel loginModel = LoginModel();

  Future<List<Restorent>?> getRestorent() async {
    try {
      var data = await RestorentService.restorent();

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
    getRestorent().then((value) => restorent.value = value!);
    update();
    super.onInit();
  }
}
