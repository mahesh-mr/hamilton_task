// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/const.dart';
import 'glass_more_prisson.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    Key? key,
    required this.title,
    required this.leadingType,
    required this.apbarType,
    this.trailing,
  }) : super(key: key);
  final String title;
  final String leadingType;
  final Widget? trailing;
  final String apbarType;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 90,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [appBlue, appBlueLight],
              )),
            ),
            const SizedBox(
              height: 40,
              width: double.infinity,
            )
          ],
        ),
        Positioned(
          top: 40,
          left: 20,
          child: CustomGlassMorePrissom(
            width: 350,
            height: 80,
            widget: Row(
              children: [
                leadingType == "1"
                    ? IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios,
                            color: appBackground),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Color.fromARGB(255, 184, 182, 195),
                          child: CircleAvatar(
                            backgroundColor: appBlue,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.menu,
                                    color: appBackground)),
                          ),
                        ),
                      ),
                SizedBox(
                    width: 230,
                    height: 30,
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(fontSize: 20, color: appBackground),
                    )),
                apbarType == "1"
                    ? const CircleAvatar(
                        radius: 25,
                        backgroundColor: Color.fromARGB(255, 184, 182, 195),
                        child: CircleAvatar(
                          backgroundColor: appBlue,
                          child: Icon(
                            Icons.settings,
                            color: appBackground,
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
