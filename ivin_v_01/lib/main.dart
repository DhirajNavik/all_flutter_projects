import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivin_v_01/app/modules/Login/view/login_page.dart';
import 'package:ivin_v_01/app/modules/polling_screening/controller/polling_screening_view_controller.dart';
import 'package:ivin_v_01/app/modules/polling_screening/view/polling_screening_view.dart';
import 'package:ivin_v_01/app_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: ThemeData.dark(),
      initialBinding: AppBinding(),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
