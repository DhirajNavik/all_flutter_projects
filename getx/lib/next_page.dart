import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/get_off.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("SecondPage"),
          ),
          body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              InkWell(
                onTap: () {
                  print("SecondPage");
                  // Get.back(result: "Went Back");
                  Get.off(() => GetOff());
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.orange,
                  child: Text(Get.arguments ?? "Null"),
                ),
              ),
            ]),
          )),
    );
  }
}
