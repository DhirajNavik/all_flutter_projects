import 'package:flutter/material.dart';

class ChallengeThree2 extends StatelessWidget {
  const ChallengeThree2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: 300,
        height: 400,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 121, 187, 242),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(1000),
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, offset: Offset(10, 10), blurRadius: 10)
            ]),
      )),
    );
  }
}
