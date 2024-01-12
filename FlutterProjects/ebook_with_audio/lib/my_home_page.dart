import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ebook_with_audio/appcolors.dart' as AppColors;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List popularBooks = [];
  late ScrollController _scrollController;
  late TabController _tabController;

  ReadData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/popularBooks.json')
        .then((s) {
      setState(() {
        popularBooks = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    ReadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
          child: Scaffold(
        body: Column(children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImageIcon(
                  AssetImage("asset/img/menu.png"),
                  size: 24,
                  color: Colors.black,
                ),
                Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.notifications)
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Popular Books",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 180,
            child: Stack(children: [
              Positioned(
                  top: 0,
                  left: -25,
                  right: 0,
                  bottom: 0,
                  child: Container(
                      height: 180,
                      child: PageView.builder(
                          controller: PageController(viewportFraction: 0.8),
                          itemCount:
                              popularBooks.isEmpty ? 0 : popularBooks.length,
                          itemBuilder: (_, i) {
                            return Container(
                              height: 180,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(popularBooks[i]["img"]),
                                    fit: BoxFit.fill),
                              ),
                            );
                          }))),
            ]),
          ),
          Expanded(
              child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (BuildContext context, bool isScroll) {
              return [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: AppColors.sliverBackground,
                  bottom: PreferredSize(
                      preferredSize: Size.fromHeight(50),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: TabBar(
                          indicatorPadding: EdgeInsets.all(0),
                          indicatorSize: TabBarIndicatorSize.label,
                          labelPadding: EdgeInsets.only(right: 10),
                          controller: _tabController,
                          isScrollable: true,
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 7,
                                    offset: Offset(0, 0))
                              ]),
                          tabs: [
                            Container(
                              width: 120,
                              height: 60,
                              child: Text(
                                "New",
                                style: TextStyle(color: Colors.white),
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppColors.menu1Color,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 7,
                                        offset: Offset(0, 0))
                                  ]),
                            ),
                            Container(
                              width: 120,
                              height: 60,
                              child: Text(
                                "New",
                                style: TextStyle(color: Colors.white),
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppColors.menu2Color,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 7,
                                        offset: Offset(0, 0))
                                  ]),
                            ),
                            Container(
                              width: 120,
                              height: 60,
                              child: Text(
                                "New",
                                style: TextStyle(color: Colors.white),
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppColors.menu3Color,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 7,
                                        offset: Offset(0, 0))
                                  ]),
                            )
                          ],
                        ),
                      )),
                )
              ];
            },
            body: TabBarView(controller: _tabController, children: [
              Material(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                  ),
                  title: Text("Content"),
                ),
              ),
              Material(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                  ),
                  title: Text("Content"),
                ),
              ),
              Material(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                  ),
                  title: Text("Content"),
                ),
              )
            ]),
          ))
        ]),
      )),
    );
  }
}
