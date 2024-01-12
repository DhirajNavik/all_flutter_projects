import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivin_v_01/app/data/model/dto/RepoResponse.dart';
import 'package:ivin_v_01/app/data/model/dto/User.dart';
import 'package:ivin_v_01/app/data/model/request/login_request.dart';
import 'package:ivin_v_01/app/data/model/response/generic_response.dart';
import 'package:ivin_v_01/app/data/repository/auth_repository.dart';
import 'package:ivin_v_01/app/modules/details_page/view/details_page_view.dart';
import 'package:ivin_v_01/base/base_controller.dart';
import 'package:ivin_v_01/utils/loading/loading_screen.dart';
import 'package:ivin_v_01/utils/storage/app_utils.dart';

class LoginPageController extends BaseController<AuthRepository> {
  RxBool isIconVisible = RxBool(true);

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  handlingVisibility() {
    isIconVisible.toggle();
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // logi(String email, String password) async {
  //   if (passwordController.text.isNotEmpty &&
  //       userNameController.text.isNotEmpty) {
  //     final response = await http.post(
  //         Uri.parse("http://172.105.37.117:8000/UserIvin-API/login_mobile/"),
  //         body: {"Email": email, "Password": password});
  //     if (response.statusCode == 200) {
  //       var data = response.body.toString();
  //       print(data);
  //       print("successfull");
  //       Get.off(() => DetailsPageView());
  //     } else {
  //       print("unsuccessful");
  //     }
  //   }
  // }

  login() async {
    if (passwordController.text.isNotEmpty &&
        userNameController.text.isNotEmpty) {
      LoadingUtils.showLoader();
      LoginRequest loginCredential = LoginRequest(
          email: userNameController.text, password: passwordController.text);
      RepoResponse<GenericResponse> response =
          await repository.login(loginCredential);

      if (response.data?.status == 200) {
        LoadingUtils.showLoader();

        User userData = User.fromJson(response.data?.result);
        LoadingUtils.hideLoader();
        log(userData.toString());
        print(userData.email);
        Get.off(() => DetailsPageView());
      } else {
        if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
        AppUtils.showSnackBar('${response.error?.message}');
      }
    }
  }

  // Timer Controller
}
