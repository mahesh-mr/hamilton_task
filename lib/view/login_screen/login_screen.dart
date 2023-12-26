import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hamilton_task/view/const/const.dart';
import 'package:hamilton_task/view/login_screen/widgets/loginTextForm.dart';
import 'package:hamilton_task/view/register_screeen/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/services/login_service.dart';
import '../const/size.dart';
import '../home_screen/home_screen.dart';
import '../widgets/glass_more_prisson.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  List<String> logos = [
    "assets/google_png.png",
    "assets/fb.png",
    "assets/apple.png",
    "assets/logo-twitter-png-5860.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [appBlueLight, appBlue],
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/logo_req.png",
                      height: 120,
                      width: 120,
                    ),
                    const Text(
                      'Requeue',
                      style: TextStyle(color: appBackground, fontSize: 20),
                    )
                  ],
                ),
                h10,
                CustomGlassMorePrissom(
                    width: double.infinity,
                    height: 350,
                    widget: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Login your account",
                              style: TextStyle(fontSize: 16),
                            ),
                            h10,
                            LoginTextformWidget(
                              textController: phoneNumberController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password minimum  1 length";
                                } else if (value.length < 3) {
                                  return "enter minimum 3 characters";
                                } else {
                                  return null;
                                }
                              },
                              textinputType: TextInputType.phone,
                              hintText: "Phone",
                              prefixIcon: Icons.person,
                            ),
                            h10,
                            LoginTextformWidget(
                              textController: passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password minimum  1 length";
                                } else if (value.length < 3) {
                                  return "enter minimum 3 characters";
                                } else {
                                  return null;
                                }
                              },
                              textinputType: TextInputType.visiblePassword,
                              hintText: "Password",
                              prefixIcon: Icons.lock,
                            ),
                            h10,
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Forgot your password?",
                                style: TextStyle(
                                  color: appBackground,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            h10,
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor: appBlue,
                                    minimumSize:
                                        const Size(double.infinity, 60),
                                    elevation: 0),
                                onPressed: () async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  bool isValid =
                                      formkey.currentState!.validate();
                                  if (isValid) {
                                    print("object");
                                    LoginService.LoginScreen(
                                        phoneNo: phoneNumberController.text,
                                        password: passwordController.text);

                                    //   print();
                                    print(passwordController.text);
                                    final token = prefs.getString('token');
                                    print("tok : $token");
                                    if (token != null) {
                                      Get.offAll(const HomeScreen(),
                                          transition: Transition.noTransition,
                                          duration: const Duration(seconds: 1));
                                    }
                                  }
                                },
                                child: const Text("Login")),
                          ],
                        ),
                      ),
                    )),
                h20,
                Row(
                  children: [
                    const Text("You don't have an account yet !"),
                    TextButton(
                        onPressed: () {
                          Get.to(RegisterScreen());
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                            color: appBackground,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        )),
                  ],
                ),
                h20,
                Row(
                  children: const [
                    Expanded(
                        child: Divider(
                      thickness: 2,
                      color: appBackground,
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text("Login with"),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 2,
                      color: appBackground,
                    ))
                  ],
                ),
                h20,
                LimitedBox(
                  maxHeight: 60,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    separatorBuilder: (context, index) => w20,
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 60,
                        width: 65,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(logos[index])),
                            borderRadius: BorderRadius.circular(10),
                            color: appBackground),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        //  Align(
        //     alignment: Alignment.center,
        //     child: Image.asset(
        //       "images/app_logo.png",
        //       width: 128,
        //       height: 128,
        //     )),
      ),
    );
    ;
  }
}
