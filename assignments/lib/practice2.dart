import 'package:flutter/material.dart';

class Practice2 extends StatelessWidget {
  const Practice2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: 200,
          height: 150,
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            borderRadius: BorderRadius.circular(20),
          ),
        ));
  }
}
