import 'package:flutter/material.dart';

class ChallengeThree3 extends StatelessWidget {
  const ChallengeThree3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Container(
        width: 350,
        height: 600,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: 300,
              height: 400,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 121, 187, 242),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(300),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(10, 10),
                      blurRadius: 10,
                    )
                  ]),
            ),
            Container(
              width: 200,
              margin: const EdgeInsets.fromLTRB(0, 0, 45, 400),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                "assets/tablets_image.png",
              ))),
            )
          ],
        ),
      )),
    );
  }
}
