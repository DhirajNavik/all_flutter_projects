import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:roject/Models/ivin_model.dart';

class IvinEg extends StatefulWidget {
  const IvinEg({super.key});

  @override
  State<IvinEg> createState() => _IvinEgState();
}

class _IvinEgState extends State<IvinEg> {
  Future<PollingStationModule> getPollingData() async {
    final response = await http.get(Uri.parse(
        "http://172.105.37.117:8000/Ivin_1/GetpollingstationbyEmail/sruji%40gmail.com/"));

    var datax = jsonDecode(response.body.toString());
    print(datax);
    if (response.statusCode == 200) {
      return PollingStationModule.fromJson(datax);
    } else {
      return PollingStationModule.fromJson(datax);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Example_yy'),
        ),
        body: Column(
          children: [
            Expanded(
                child: FutureBuilder<PollingStationModule>(
              future: getPollingData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.result!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: CustomRow(
                                        title: "Polling Station Name : ",
                                        data:
                                            "${snapshot.data?.result?[index].pollingStationNameNum}"))
                              ],
                            ),
                          ),
                        );
                      });
                } else {
                  return Text("No data");
                }
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
