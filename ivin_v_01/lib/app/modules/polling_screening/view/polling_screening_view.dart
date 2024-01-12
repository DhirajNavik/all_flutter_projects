import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivin_v_01/app/modules/polling_screening/controller/polling_screening_view_controller.dart';
import 'package:ivin_v_01/common_widgets/common_buttons.dart';

class PoolingScreeningView extends GetView<PollingStationViewController> {
  PoolingScreeningView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.generateDropDownList();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Obx(
              () => Column(
                children: [
                  Transform.scale(
                      scale: 1.5,
                      child: Obx(
                        () => Switch(
                            activeColor: Colors.purple[200],
                            value: controller.isSwitchStatus.value,
                            onChanged: (v) {
                              print(v);
                              controller.onSwitchSelect();
                            }),
                      )),
                  AnimatedCrossFade(
                      firstChild: Text(
                        "Outside Voter",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      secondChild: Text(
                        "Inside Voter ",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      crossFadeState: !controller.isSwitchStatus.value
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: Duration(milliseconds: 100)),
                ],
              ),
            ),
          ).paddingOnly(right: 20, bottom: 10),
          Obx(
            () => Container(
              width: MediaQuery.of(context).size.width - 30,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                  borderRadius: BorderRadius.circular(30)),
              child: DropdownButton(
                      iconSize: 40,
                      isExpanded: true,
                      hint: Text(
                        "Polling Stations",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      value: controller.selected.value == ''
                          ? null
                          : controller.selected.value,
                      onChanged: (newValue) {
                        controller.setSelected(newValue.toString());
                      },
                      items: controller.dropDownList
                          .map((item) => DropdownMenuItem<String>(
                              value: item, child: Text(item)))
                          .toList()
                      // items: controller.finalDropDownList.keys
                      //     .map<DropdownMenuItem<String>>((values) {
                      //   return DropdownMenuItem(
                      //     value: values,
                      //     child: Text(values),
                      //   );
                      // }).toList(),
                      )
                  .paddingSymmetric(horizontal: 20),
            ).paddingOnly(bottom: 10),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      child: Column(children: [
                        Text(
                          "Marked",
                          style: TextStyle(fontSize: 25),
                        ).paddingSymmetric(horizontal: 20),
                        Text(
                          "0",
                          style:
                              TextStyle(fontSize: 25, color: Colors.green[300]),
                        ),
                      ]),
                    ),
                    Card(
                      child: Column(children: [
                        Text(
                          "UnMarked",
                          style: TextStyle(fontSize: 25),
                        ).paddingSymmetric(horizontal: 20),
                        Text(
                          "0",
                          style:
                              TextStyle(fontSize: 25, color: Colors.green[300]),
                        ),
                      ]),
                    ),
                    Card(
                      child: Column(children: [
                        Text(
                          "Total",
                          style: TextStyle(fontSize: 25),
                        ).paddingSymmetric(horizontal: 20),
                        Text(
                          controller.selected.value == ""
                              ? "0"
                              : "${controller.pollingStationCountResult}",
                          style:
                              TextStyle(fontSize: 25, color: Colors.green[300]),
                        )
                      ]),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Obx(
              () => Card(
                elevation: 5,
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.7,
                  child: controller.selected.value == ""
                      ? Center(
                          child: Text("Select"),
                        )
                      : GridView.builder(
                          controller: controller.scrollController,
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.selected.value == ""
                              ? 0
                              : controller.pollingStationCountResult.toInt(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      (MediaQuery.of(context).size.width / 70)
                                          .toInt()),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Text((index + 1).toString()),
                                Obx(
                                  () => Checkbox(
                                    value: !controller.isSwitchStatus.value
                                        ? controller.checkBoxValueList.isEmpty
                                            ? false
                                            : controller
                                                .checkBoxValueList[index]
                                        : controller
                                                .insideCheckBoxexList.isEmpty
                                            ? false
                                            : controller
                                                .insideCheckBoxexList[index],
                                    onChanged: !controller.isSwitchStatus.value
                                        ? (value) {
                                            controller.onOutsideClick(
                                                index, value);
                                            controller.isOutsideUpdated(
                                                controller.selected.value,
                                                index);
                                          }
                                        : (value) {
                                            controller.onInsideClick(
                                                index, value);
                                            controller.isInsideUpdated(
                                                controller.selected.value,
                                                index);
                                          },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                ),
              ),
            ),
          ).paddingOnly(left: 20, right: 20, top: 20),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  print("Download");
                  controller.getPollingOutsideData(controller.selected.value);
                },
                child: CommonButton(text: "Download"),
              ),
            ).paddingSymmetric(horizontal: 30),
          ),
        ],
      ).paddingOnly(top: 20),
    );
  }
}
