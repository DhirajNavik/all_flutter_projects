import 'package:flutter/material.dart';

class ChallengeTwo1 extends StatelessWidget {
  const ChallengeTwo1({super.key});
  @override
  Widget build(BuildContext context) {
    final boxContainer = Container(
      width: 120,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(20)),
    );

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [boxContainer, boxContainer],
          ),
        ));
  }
}
