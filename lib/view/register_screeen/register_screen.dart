// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamilton_task/controller/services/restorent_service.dart';
import 'package:hamilton_task/view/login_screen/login_screen.dart';

import 'package:hamilton_task/view/register_screeen/widgets/custom_text_form.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/services/register_service.dart';
import '../../main.dart';
import '../const/const.dart';
import '../const/size.dart';
import '../widgets/eleveted_button_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();

  final userNameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final passController = TextEditingController();
  String phoneNo = "";
  String countryName= "";
  String alertText = "";
  final formkey = GlobalKey<FormState>();

  bool _checkbox = false;

  @override
  Widget build(BuildContext context) {
    //    String? token = sharedPreferences.getString("token");

    return Scaffold(
     
      backgroundColor: appBackground,
      appBar: AppBar(
        titleTextStyle: const TextStyle(
            color: appBlack, fontWeight: FontWeight.bold, fontSize: 20),
        backgroundColor: appBackground,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: appBlack,
          ),
        ),
        title: const Text("Sign Up"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                h20,
                CustomTextformWidget(
                  onChanged: (p0) {},
                  textinputType: TextInputType.name,
                  textController: userNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password minimum  1 length";
                    } else if (value.length < 3) {
                      return "enter minimum 3 characters";
                    } else {
                      return null;
                    }
                  },
                  lebelText: "Username",
                ),
                h20,
                CustomTextformWidget(
                  onChanged: (p0) {},
                  textinputType: TextInputType.name,
                  textController: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password minimum  1 length";
                    } else if (value.length < 3) {
                      return "enter minimum 3 characters";
                    } else {
                      return null;
                    }
                  },
                  lebelText: "Full Name",
                ),
                h20,
                CustomTextformWidget(
                  onChanged: (p0) {},
                  textinputType: TextInputType.emailAddress,
                  textController: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password minimum  1 length";
                    } else if (value.length < 3) {
                      return "enter minimum 3 characters";
                    } else {
                      return null;
                    }
                  },
                  lebelText: "Email",
                ),
                h20,
                CustomTextformWidget(
                  onChanged: (value) {
                    print(" phno : $phoneNo");
                  },
                  textinputType: TextInputType.phone,
                  textController: phoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password minimum  1 length";
                    } else if (value.length < 3) {
                      return "enter minimum 3 characters";
                    } else {
                      return null;
                    }
                  },
                  lebelText: "Phone",
                  prefix: SizedBox(
                    height: 25,
                    width: 60,
                    child: CountryPickerDropdown(
                      isExpanded: true,
                      icon: const VerticalDivider(
                        color: appBlack,
                        thickness: 1,
                      ),
                      hint: const Text("contry"),
                      isDense: true,
                      initialValue: 'in',
                      itemBuilder: (country) {
                        return Text(" +${country.phoneCode}");
                      },
                      onValuePicked: (Country country) {
                        setState(() {
                          phoneNo = country.phoneCode;
                          countryName =country.name.toString();
                        });

                        print("${country.phoneCode}");
                           print("${country.name}");

                      },
                    ),
                  ),
                ),
                h20,
                CustomTextformWidget(
                  onChanged: (p0) {},
                  textinputType: TextInputType.visiblePassword,
                  textController: passController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password minimum  1 length";
                    } else if (value.length < 3) {
                      return "enter minimum 3 characters";
                    } else {
                      return null;
                    }
                  },
                  lebelText: "Password",
                ),
                h20,
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        activeColor: appBlue,
                        value: _checkbox,
                        onChanged: (value) {
                          setState(() {
                            _checkbox = !_checkbox;
                          });
                        },
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.start,
                      text: const TextSpan(
                        text: "I egree with the company's",
                        style: TextStyle(color: appGrey, height: 1.5),
                        children: [
                          TextSpan(
                              text: "Privacy Policy\n",
                              style: TextStyle(
                                  color: appBlue,
                                  decoration: TextDecoration.underline)),
                          TextSpan(text: 'and '),
                          TextSpan(
                            text: "Terms of Services. ",
                            style: TextStyle(
                                color: appBlue,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                _checkbox == false
                    ? const SizedBox()
                    : Text(
                        alertText,
                        style: const TextStyle(color: Colors.red, fontSize: 14),
                      ),
                h20,
                ElevetedButtonWidget(
                  height: 60,
                  width: double.infinity,
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                        prefs.setString('country', countryName);
                    bool isValid = formkey.currentState!.validate();
                    if (_checkbox != false) {
                      if (isValid) {
                        print("object");
                        RegisterService.registerUser(
                            name: nameController.text,
                            email: emailController.text,
                            phoneNo: phoneController.text,
                            password: passController.text,
                            country: phoneNo,
                            userName: userNameController.text);

                        final token = prefs.getString('token');
                        print("tok : $token");
                        if (token != null) {
                          Get.offAll(LoginScreen(),
                              transition: Transition.noTransition,
                              duration: const Duration(seconds: 1));
                        }
                      }
                    } else {
                      alertText = "Please select Terms and Conditions";
                    }
                  },
                  title: "Sign Up",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
