import 'package:flutter/material.dart';

class ChallengeTwo6 extends StatelessWidget {
  const ChallengeTwo6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 105, 154, 195),
      body: Center(
          child: Container(
              width: 300,
              height: 350,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(40, 40, 40, 50),
                    child: const Text(
                      "Flutter App",
                      style: TextStyle(
                          color: Color.fromARGB(255, 105, 154, 195),
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                        // borderRadius: BorderRadius.circular((100))
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
