import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/zMovie.dart';

void main() {
  runApp(CountingNum());
}

class CountingNum extends StatelessWidget {
  const CountingNum({super.key});

  @override
  Widget build(BuildContext context) {
    // obs is only called when its called
    // and only update the obx not the whole widgit
    var add = 0.obs;

    // var movie = Movie();
    var movie = Movie(name: "DhirajNavik", ticket: 999).obs;

    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Obs"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text("$add")),
              ElevatedButton(
                onPressed: () {
                  add = add + 1;
                },
                child: Text("Increment"),
              ),

              // custom class obs
              // method1
              // Obx(() => Text("${movie.name}")),

              // method 2
              Obx(() => Text("${movie.value.name}")),
              ElevatedButton(
                  onPressed: () {
                    // method 1
                    // movie.name.value = "DNavik";

                    // method 2
                    movie.value.name = "DNavik";
                    movie.refresh();
                  },
                  child: Text("Change"))
            ],
          ),
        ),
      ),
    );
  }
}
