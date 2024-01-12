import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void login(String email, String password) async {
    try {
      Response response =
          await post(Uri.parse("https://reqres.in/api/login"), body: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        print("Login Successful");
        print(response.body.toString());
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    login("eve.holt@reqres.in", "pistol");
    return const Placeholder();
  }
}
