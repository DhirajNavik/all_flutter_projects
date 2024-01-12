import 'package:flutter/material.dart';
import 'package:roject/eg10.dart';
import 'package:roject/eg11.dart';
import 'package:roject/eg2.dart';
import 'package:roject/eg3.dart';
import 'package:roject/home_screen.dart';
import 'package:roject/image.dart';
import 'package:roject/ivin_eg.dart';
import 'package:roject/login.dart';
import 'package:roject/put.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // home: HomeScreem(),
        // home: Example2(),
        // home: Example3(),
        // home: Example10(),
        // home: Example11(),
        // home: LoginPage(),
        // home: ImagePickerClass(),
        // home: IvinEg(),
        home: PutApiExample());
  }
}
