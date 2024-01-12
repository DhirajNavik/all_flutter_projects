import 'package:flutter/material.dart';

class Practice4 extends StatelessWidget {
  const Practice4({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          height: 700,
          child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 240,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
              )),
        ));
  }
}
