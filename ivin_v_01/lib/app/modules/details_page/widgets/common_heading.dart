import 'package:flutter/material.dart';

class commonHeading extends StatelessWidget {
  String? textData;
  commonHeading({
    Key? key,
    required this.textData,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      "${textData} : ",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}
