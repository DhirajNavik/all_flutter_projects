import 'package:flutter/material.dart';

class ChallengeTwo3 extends StatelessWidget {
  const ChallengeTwo3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 330,
            height: 300,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 50, 0, 0),
                    child: Text(
                      "Flutter App",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
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
