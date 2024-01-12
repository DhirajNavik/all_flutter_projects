import 'package:flutter/material.dart';

class ChallengeFour2 extends StatefulWidget {
  const ChallengeFour2({super.key});
  @override
  State createState() => _ChallengeFour2();
}

class _ChallengeFour2 extends State {
  List todoItemsKey = [];
  List todoItemsValue = [];

  final TextEditingController textEditingController1 = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: textEditingController1,
              style: const TextStyle(fontSize: 25),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
                  hintText: 'Task',
                  hintStyle: const TextStyle(color: Colors.black, fontSize: 25),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.lightBlue),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.lightBlue))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: textEditingController2,
              style: const TextStyle(fontSize: 25),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
                hintText: 'Description',
                hintStyle: const TextStyle(color: Colors.black, fontSize: 25),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.lightBlue),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.lightBlue)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(50),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    todoItemsKey.add(textEditingController1.text);
                    todoItemsValue.add(textEditingController2.text);
                    textEditingController1.text = '';
                    textEditingController2.text = '';
                  });
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.fromLTRB(60, 20, 60, 20)),
                child: const Text(
                  "Create",
                  style: TextStyle(fontSize: 20),
                )),
          ),
          // todoBox(),
          Expanded(
              child: ListView.builder(
                  itemCount: todoItemsKey.length,
                  itemBuilder: (c, i) {
                    return Container(
                      margin: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(-3, 10),
                                blurRadius: 10,
                                color: Color.fromARGB(255, 196, 195, 195))
                          ]),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 20,
                        child: Row(children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  todoItemsKey[i],
                                  style: const TextStyle(
                                      fontSize: 20, letterSpacing: 0.6),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text(
                                    todoItemsValue[i],
                                    style: const TextStyle(
                                        fontSize: 18, letterSpacing: 0.6),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
