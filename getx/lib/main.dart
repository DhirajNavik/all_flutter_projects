import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/namedRouting/firstPage.dart';
import 'package:getx/namedRouting/secondPage.dart';
import 'package:getx/namedRouting/thirdPage.dart';
import 'package:getx/namedRouting/unknownPage.dart';

void main() {
  runApp(const MainNamed());
}

class MainNamed extends StatelessWidget {
  const MainNamed({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "first",
      defaultTransition: Transition.leftToRight,
      getPages: [
        GetPage(name: "/first", page: () => FirstPage()),
        GetPage(name: "/second", page: () => SecondPage()),
        GetPage(name: "/third", page: () => ThirdPage()),
      ],
      unknownRoute: GetPage(name: "/unknown", page: () => UnknownPage()),
    );
  }
}









// void main() {
//   runApp(MainPage());
// }

// class MainPage extends StatelessWidget {
//   const MainPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text("MainPage"),
//           ),
//           body: Center(
//               child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: 100,
//                 height: 100,
//                 color: Colors.red,
//                 child: InkWell(
//                   onTap: () async {
//                     print("Clicked");

//                     var a = await Get.to(
//                       () => NextPage(),
//                       // duration: Duration(seconds: 1),
//                       // curve: Curves.bounceInOut,
//                       // transition: Transition.zoom,

//                       arguments: "this is from Main Page",
//                     );
//                     print(a);
//                   },
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Get.to(() => FirstPage());
//                 },
//                 child: Text("Named Routes"),
//               )
//             ],
//           ))),
//     );
//   }
// }
