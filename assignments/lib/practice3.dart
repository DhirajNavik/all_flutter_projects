import 'package:flutter/material.dart';

class Practice3 extends StatelessWidget {
  const Practice3({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      width: 200,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(20)),
    )));
  }
}
