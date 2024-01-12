import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/next_page.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("thirdPage"),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                onPressed: () {
                  Get.offAll(NextPage());
                },
                child: Text("back")),
          ]),
        ));
  }
}
