import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  const CommonButton({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color(0xff602ea7),
      ),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      )),
    );
  }
}
