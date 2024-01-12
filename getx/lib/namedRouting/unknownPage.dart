import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("unknownPage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Error"),
          ],
        ),
      ),
    );
  }
}
