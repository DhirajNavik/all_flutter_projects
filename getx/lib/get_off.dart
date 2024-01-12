import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetOff extends StatelessWidget {
  const GetOff({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("ThirdPage"),
          ),
          body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              InkWell(
                onTap: () {
                  print("Next??");
                  Get.offNamed("/first");
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                ),
              ),
            ]),
          )),
    );
  }
}
