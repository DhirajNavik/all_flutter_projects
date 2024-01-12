import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Example10 extends StatefulWidget {
  const Example10({super.key});

  @override
  State<Example10> createState() => _Example10State();
}

class _Example10State extends State<Example10> {
  List data = [];
  Future<void> getUserApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example4'),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
            child: FutureBuilder(
          future: getUserApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return (Text("Loading.."));
            } else {
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(children: [
                        CustomRow(title: "Name", data: data[index]['name']),
                        CustomRow(
                            title: "Address",
                            data: data[index]['address']['street'])
                      ]),
                    );
                  });
            }
          },
        ))
      ]),
    );
  }
}

class CustomRow extends StatelessWidget {
  String title, data;
  CustomRow({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text(data)],
      ),
    );
  }
}
