import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivin_v_01/app/modules/Login/controller/login_page_controller.dart';
import 'package:ivin_v_01/app/modules/details_page/controller/details_page_controller.dart';
import 'package:ivin_v_01/app/modules/details_page/widgets/common_heading.dart';

String deviceIDs = "";

class DetailsPageView extends GetView<DetailsPageController> {
  DetailsPageView({super.key});

  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  final LoginPageController loginPageController =
      Get.put(LoginPageController());

  final styling = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Column(children: [
            Image.asset(
              "assets/images/login.png",
              width: 80,
            )
          ]),
          actions: [
            Icon(
              Icons.timer_outlined,
              color: Colors.black,
            ),
            Obx(() => Center(
                  child: Text(
                    controller.time.value,
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ).paddingOnly(right: 20, left: 5))
          ],
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonHeading(textData: "User ID"),
              Text(
                loginPageController.userNameController.text == ""
                    ? "Error.."
                    : '${loginPageController.userNameController.text}',
                style: styling,
              ).paddingOnly(top: 10)
            ],
          ).paddingSymmetric(horizontal: 20, vertical: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonHeading(textData: "Device ID"),
              showAndroidInfo() ?? showAppleInfo()
            ],
          ).paddingSymmetric(horizontal: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonHeading(textData: "Polling Station").paddingOnly(top: 10),
            ],
          ).paddingSymmetric(vertical: 10, horizontal: 20),
          Expanded(
              flex: 3,
              child: FutureBuilder(
                  future: controller.getPollingStationDetails(
                      loginPageController.userNameController.text),
                  builder: (context, snapshot) {
                    if (controller.pollingStationList.isEmpty) {
                      return Center(
                        child: Text(
                          "Loading...",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: controller.pollingStationList.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Icon(Icons.how_to_vote_outlined)
                                    .paddingOnly(right: 10),
                                Text(
                                  "Pooling Booth - ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    controller.pollingStationList[index],
                                  ),
                                )
                              ],
                            ).paddingSymmetric(horizontal: 20, vertical: 2.5);
                          });
                    }
                  })),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Checkbox(
                  value: controller.checkbox.value,
                  onChanged: (value) {
                    controller.onCheckboxClick();
                  },
                ),
              ),
              Flexible(
                child: Text(
                  "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I ut I must explain to you how all this mistaken idea of denouncing pleasure and praising painwill give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. ",
                  textAlign: TextAlign.justify,
                ).paddingOnly(top: 10),
              ),
            ],
          ).paddingOnly(top: 20, right: 20),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                  onTap: () {
                    // Get.to(() => PoolingScreeningView());
                    controller.onSubmit(deviceIDs);
                    print("Submitted");
                  },
                  child: Obx(
                    () => Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: controller.checkbox.value
                            ? Color(0xff602ea7)
                            // 602EA7
                            : Colors.lightBlue.shade100,
                      ),
                      child: Center(
                          child: Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  )).paddingSymmetric(horizontal: 30, vertical: 20),
            ),
          ),
        ]).paddingOnly(top: 20));
  }

  showAndroidInfo() {
    return FutureBuilder(
        future: deviceInfoPlugin.androidInfo,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            AndroidDeviceInfo info = snapshot.data!;
            deviceIDs = info.id;
            print(info.display);
            return Column(children: [
              Text(
                info.id,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              )
            ]);
          } else {
            return Text("No Data", textAlign: TextAlign.center, style: styling);
          }
        }).paddingOnly(top: 10);
  }

  showAppleInfo() {
    return FutureBuilder(
        future: deviceInfoPlugin.iosInfo,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            IosDeviceInfo info = snapshot.data!;
            deviceIDs = info.identifierForVendor.toString();

            print(info.identifierForVendor);
            return Column(children: [
              Text(
                info.identifierForVendor.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              )
            ]);
          } else {
            return Text("No Data", textAlign: TextAlign.center, style: styling);
          }
        }).paddingOnly(top: 10);
  }
}
