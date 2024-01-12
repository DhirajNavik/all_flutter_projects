import 'package:get/get.dart';
import 'package:ivin_v_01/app/data/network/network_requester.dart';
import 'package:ivin_v_01/app/data/repository/auth_repository.dart';
import 'package:ivin_v_01/app/data/repository/polling_day_repository.dart';
import 'package:ivin_v_01/app/modules/Login/controller/login_page_controller.dart';
import 'package:ivin_v_01/app/modules/details_page/controller/details_page_controller.dart';
import 'package:ivin_v_01/app/modules/polling_screening/controller/polling_screening_view_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkRequester(), permanent: true);
    Get.put(AuthRepository(), permanent: true);
    Get.put(LoginPageController(), permanent: true);
    Get.put(DetailsPageController(), permanent: true);
    Get.put(PollingStationViewController(), permanent: true);
    Get.put(PollingStationRepository(), permanent: true);
  }
}
