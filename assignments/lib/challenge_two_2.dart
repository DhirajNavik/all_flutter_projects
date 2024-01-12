import 'package:flutter/material.dart';

class ChallengeTwo2 extends StatelessWidget {
  const ChallengeTwo2({super.key});

  @override
  Widget build(BuildContext context) {
    final boxContainer = Container(
      margin: const EdgeInsets.all(15.0),
      width: 350,
      height: 300,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(20)),
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [boxContainer, boxContainer],
        ),
      ),
    );
  }
}
