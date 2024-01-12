import 'package:flutter/material.dart';

class ChallengeTwo7 extends StatelessWidget {
  const ChallengeTwo7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image:
                  DecorationImage(image: AssetImage('assets/home_image.png'))),
        ),
      ),
    );
  }
}
