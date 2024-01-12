// import 'package:flutter/material.dart';

// class CommonGridCheckBox extends StatelessWidget {
//   final ScrollController controller;
//   CommonGridCheckBox({
//     required this.controller,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5,
//       shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       child: Container(
//         height: MediaQuery.of(context).size.height / 1.5,
//         child: GridView.builder(
//           physics: ScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: controller.checkboxesValue.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: (MediaQuery.of(context).size.width / 70).toInt()),
//           itemBuilder: (context, index) {
//             return Column(
//               children: [
//                 Text((index + 1).toString()),
//                 Obx(
//                   () => Checkbox(
//                     value: controller.checkboxesValue[index],
//                     onChanged: (value) {
//                       controller.onClicked(index, value);
//                     },
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     ).paddingOnly(left: 20, right: 20, top: 20);
//   }
// }
