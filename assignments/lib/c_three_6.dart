import 'package:flutter/material.dart';

class ChallengeThree6 extends StatelessWidget {
  const ChallengeThree6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: 1000,
        height: 1000,
        color: const Color.fromARGB(255, 143, 193, 235),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: 350,
              height: 450,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(300),
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(10, 10),
                      blurRadius: 10,
                    ),
                  ]),
              child: Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 116, 206, 189),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: const Icon(
                    Icons.thumb_up_rounded,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 60, 460),
              width: 230,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                "assets/tablets_image.png",
              ))),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
              // width: 280,
              height: 180,
              child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Medicine',
                      style: TextStyle(
                          color: Color.fromARGB(255, 143, 193, 235),
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.5),
                    ),
                    Text(
                      "We asked several medical students why they chose to study medicine",
                      style: TextStyle(fontSize: 22),
                    ),
                  ]),
            ),
          ],
        ),
      )),
    );
  }
}
