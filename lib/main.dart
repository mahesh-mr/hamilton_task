import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hamilton_task/view/Login_Screen/login_screen.dart';
import 'package:hamilton_task/view/home_screen/home_screen.dart';
import 'package:hamilton_task/view/register_screeen/register_screen.dart';
import 'package:hamilton_task/view/restorent_screen/restorent_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

//late SharedPreferences sharedPreferences;
void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    );
  }
}
