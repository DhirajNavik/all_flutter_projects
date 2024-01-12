import 'package:flutter/material.dart';
import 'package:roject/Models/outside_model.dart';
import 'package:roject/baseClass.dart';

class PutApiExample extends StatelessWidget {
  const PutApiExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              var user = outsideVoteModule(outsideVoter: false);

              var response = await BaseClass().put(user).catchError((err) {});
              if (response == null) return;
              debugPrint("Success: ");
            },
            child: Text("Put")),
      ),
    );
  }
}
