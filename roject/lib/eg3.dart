import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:roject/Models/user_model.dart';

class Example3 extends StatefulWidget {
  const Example3({super.key});

  @override
  State<Example3> createState() => _Example3State();
}

class _Example3State extends State<Example3> {
  List<UserModel> usersLists = [];

  Future<List<UserModel>> getUsersApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    var data = jsonDecode(response.body.toString());
    print(data);

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        usersLists.add(UserModel.fromJson(i));
      }
      print(usersLists);
      return usersLists;
    } else {
      return usersLists;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Example_3'),
        ),
        body: Column(
          children: [
            Expanded(
                child: FutureBuilder(
              future: getUsersApi(),
              builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                return ListView.builder(
                    itemCount: usersLists.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              CustomRow(
                                  title: "Name",
                                  data: "${snapshot.data![index].username}"),
                              CustomRow(
                                  title: "Address",
                                  data:
                                      "${snapshot.data![index].address!.city}"),
                            ],
                          ),
                        ),
                      );
                    });
              },
            )),
          ],
        ));
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
