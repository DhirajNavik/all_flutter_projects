import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivin_v_01/app/modules/Login/controller/login_page_controller.dart';
import 'package:ivin_v_01/app/modules/details_page/view/details_page_view.dart';

FocusNode usernamefocus = FocusNode();
FocusNode passwordfocus = FocusNode();

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).scaffoldBackgroundColor,
                      BlendMode.modulate),
                  child: Image.asset(
                    "assets/images/login.png",
                    // color: Colors.grey.withOpacity(0),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Login",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Please sign in to continue",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.userNameController,
                focusNode: usernamefocus,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(passwordfocus);
                },
                style: TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "UserName",
                  labelText: "UserName",
                ),
              ).paddingOnly(bottom: 20, left: 30, right: 30),
              Obx(
                () => TextFormField(
                  controller: controller.passwordController,
                  obscureText: controller.isIconVisible.value,
                  focusNode: passwordfocus,
                  onFieldSubmitted: (value) {
                    return;
                  },
                  obscuringCharacter: "*",
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          controller.handlingVisibility();
                        },
                        child: Icon(controller.isIconVisible.value
                            ? Icons.visibility_off_rounded
                            : Icons.visibility),
                      )),
                ),
              ).paddingOnly(left: 30, right: 30, bottom: 10),
              GestureDetector(
                onTap: () {
                  controller.login();
                  // Get.to(() => DetailsPageView());
                  print(controller.userNameController.text);
                  print(controller.passwordController.text);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                          colors: [Color(0xffFF7A5C), Color(0xffF04A3D)])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ).paddingOnly(right: 20),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 20,
                      )
                    ],
                  ),
                ).paddingOnly(left: 20, right: 20, top: 55),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class CommonInputField extends StatelessWidget {
//   final String hintText;
//   final TextEditingController textController = TextEditingController();

//   CommonInputField({@required textController, this.hintText = '', Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return 
//   };
// }
