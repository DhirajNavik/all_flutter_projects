import 'package:flutter/material.dart';

class ChallengeThree5 extends StatelessWidget {
  const ChallengeThree5({super.key});

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
                    )
                  ]),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 50, 460),
              width: 240,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                "assets/tablets_image.png",
              ))),
            ),
            const SizedBox(
              // width: 280,
              height: 180,
              child: Padding(
                padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Medicine',
                        style: TextStyle(
                            color: Color.fromARGB(255, 143, 193, 235),
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "We asked several medical students why they chose to study medicine",
                        style: TextStyle(fontSize: 22),
                      )
                    ]),
              ),
            )
          ],
        ),
      )),
    );
  }
}
