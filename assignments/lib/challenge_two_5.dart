import 'package:flutter/material.dart';

class ChallengeTwo5 extends StatelessWidget {
  const ChallengeTwo5({super.key});

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
            height: 260,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 244, 244, 244),
                borderRadius: BorderRadius.circular(20)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
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
                padding: const EdgeInsets.fromLTRB(40, 50, 40, 0),
                child: Container(
                  width: 250,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ]),
          )
        ],
      )),
    );
  }
}
