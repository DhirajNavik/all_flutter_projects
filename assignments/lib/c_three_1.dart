import 'package:flutter/material.dart';

class ChallengeThree1 extends StatelessWidget {
  const ChallengeThree1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: 350,
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, offset: Offset(10, 10), blurRadius: 10)
            ]),
      )),
    );
  }
}
