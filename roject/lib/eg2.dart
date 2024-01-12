import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Example2 extends StatefulWidget {
  const Example2({super.key});

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  List<Photos> photosList = [];

  Future<List<Photos>> getPhotos() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));

    var dataw = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in dataw) {
        Photos photos = Photos(title: i['title'], url: i['url'], id: i['id']);
        photosList.add(photos);
      }

      return photosList;
    } else {
      return photosList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Example2'),
      ),
      body: Column(children: [
        Expanded(
          child: FutureBuilder(
              future: getPhotos(),
              builder: (context, AsyncSnapshot<List<Photos>> snapdhot) {
                return ListView.builder(
                    itemCount: photosList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapdhot.data![index].url.toString())),
                        subtitle: Text(snapdhot.data![index].title.toString()),
                        title:
                            Text("ID : " + snapdhot.data![index].id.toString()),
                      );
                    });
              }),
        )
      ]),
    );
  }
}

class Photos {
  String title, url;
  int id;

  Photos({
    required this.title,
    required this.url,
    required this.id,
  });
}
