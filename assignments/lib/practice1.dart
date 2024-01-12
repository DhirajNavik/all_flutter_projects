import 'package:flutter/material.dart';

class Practice1 extends StatelessWidget {
  const Practice1({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Text(
        'Flutter',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w600, letterSpacing: 1),
      )),
    );
  }
}
