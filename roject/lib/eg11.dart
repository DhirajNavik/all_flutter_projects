import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:roject/Models/example11.dart';

class Example11 extends StatefulWidget {
  const Example11({super.key});

  @override
  State<Example11> createState() => _Example11State();
}

class _Example11State extends State<Example11> {
  Future<Example11Model> getProductApi() async {
    final response = await http.get(
        Uri.parse("https://webhook.site/484fafe5-d0b1-4880-bdd6-0f7ae6bee755"));

    var datax = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return Example11Model.fromJson(datax);
    } else {
      return Example11Model.fromJson(datax);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example5"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<Example11Model>(
                  future: getProductApi(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print('-----------');
                      return ListView.builder(
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(snapshot
                                    .data!.data![index].saleTitle
                                    .toString()),
                                subtitle: Text(snapshot
                                    .data!.data![index].shop!.shopaddress
                                    .toString()),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(snapshot
                                      .data!.data![index].shop!.image
                                      .toString()),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height * .3,
                                width: MediaQuery.of(context).size.width * 1,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot
                                      .data!.data![index].images!.length,
                                  itemBuilder: (contextx, indexx) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .25,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .5,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(snapshot
                                                    .data!
                                                    .data![index]
                                                    .images![indexx]
                                                    .url
                                                    .toString()))),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              snapshot.data!.data![index].inWishlist
                                          .toString() ==
                                      'true'
                                  ? Icon(Icons.favorite)
                                  : Icon(Icons.heart_broken)
                            ],
                          );
                        },
                      );
                    } else {
                      return Text("Loading...");
                    }
                  }))
        ],
      ),
    );
  }
}
