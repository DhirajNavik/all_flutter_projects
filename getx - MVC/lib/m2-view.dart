import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller.dart';

// Reactive State manager Get X
class HomeView2 extends StatelessWidget {
  // var myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("MVC"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetX<MyController>(
                //
                init: MyController(),
                //
                builder: (m2) => Text("${m2.count}"),
              ),
              ElevatedButton(
                  onPressed: () {
                    var myController = Get.find<MyController>();

                    myController.incrementCounter();
                    ;
                  },
                  child: Text("incrementing"))
            ],
          ),
        ),
      ),
    );
  }
}
