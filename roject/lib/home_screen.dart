import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:roject/Models/eg.dart';

class HomeScreem extends StatefulWidget {
  const HomeScreem({super.key});

  @override
  State<HomeScreem> createState() => _HomeScreemState();
}

class _HomeScreemState extends State<HomeScreem> {
  List<PostsModal> postList = [];

  Future<List<PostsModal>> getPostApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        postList.add(PostsModal.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api"),
      ),
      body: Column(children: [
        Expanded(
          child: FutureBuilder(
            future: getPostApi(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text("Text Loading..");
              } else {
                return ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: Text(postList[index].title.toString()));
                    });
              }
            },
          ),
        )
      ]),
    );
  }
}
