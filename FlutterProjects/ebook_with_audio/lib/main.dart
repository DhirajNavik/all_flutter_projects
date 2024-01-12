import 'package:ebook_with_audio/my_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Audio App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: MyHomePage(),
    );
  }
}
