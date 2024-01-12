import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // instances of controller class
    // Get.put() =>create only single class throught the program
    var myController = Get.put(MyController());

    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("MVC"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text("${myController.count}")),
              ElevatedButton(
                  onPressed: () {
                    myController.incrementCounter();
                  },
                  child: Text("increment"))
            ],
          ),
        ),
      ),
    );
  }
}
