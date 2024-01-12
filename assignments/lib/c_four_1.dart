import 'package:flutter/material.dart';

class ChallengeFour1 extends StatelessWidget {
  const ChallengeFour1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Login Form",
            style: TextStyle(
                fontSize: 50,
                color: Colors.lightBlue,
                fontWeight: FontWeight.w500),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: Colors.lightBlue)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Colors.lightBlue, width: 1),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: Colors.lightBlue)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Colors.lightBlue, width: 1),
                      )),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                foregroundColor: Colors.white,
                backgroundColor: Colors.lightBlue,
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 10)),
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 30),
            ),
          )
        ],
      )),
    );
  }
}
