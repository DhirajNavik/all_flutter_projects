import 'package:get/get.dart';
import 'package:ivin_v_01/app/modules/Login/controller/login_page_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginPageController());
  }
}
