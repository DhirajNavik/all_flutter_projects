import 'package:flutter/material.dart';

class ChallengeTwo4 extends StatelessWidget {
  const ChallengeTwo4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 140, 183, 219),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 330,
            height: 300,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 244, 244, 244),
                borderRadius: BorderRadius.circular(20)),
            child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 50, 0, 0),
                    child: Text(
                      "Flutter App",
                      style: TextStyle(
                          fontSize: 35,
                          color: Color.fromARGB(255, 140, 183, 219),
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 40, 50, 0),
                    child: Text(
                      "Flutter is an Open Source UI development kit created by Google",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  )
                ]),
          )
        ],
      )),
    );
  }
}
