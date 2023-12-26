import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamilton_task/view/profile_screen/profile_screen.dart';
import 'package:hamilton_task/view/restorent_screen/restorent_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../const/const.dart';
import '../const/size.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_listtaile.dart';
import '../widgets/eleveted_button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: appBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomAppbar(
            leadingType: "0",
            title: "Profile",
            apbarType: "0",
          ),
          h20,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: appBlueLight),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        h20,
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 100),
                          child: Divider(
                            thickness: 1,
                            color: appBackground,
                          ),
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                  "https://manofmany.com/wp-content/uploads/2019/04/David-Gandy.jpg"),
                            ),
                            w10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Welcome",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: appBackground,
                                  ),
                                ),
                                Text(
                                  "Yousef bunashi",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: appBackground,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                          color: appBackground,
                        ),
                        ListTile(
                          onTap: () {
                            Get.to(RestorentScreen());
                          },
                          leading: const Icon(
                            Icons.av_timer_rounded,
                            color: appBackground,
                          ),
                          title: const Text(
                            "View Restorents",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: appBackground),
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: appBackground,
                              )),
                        ),
                        ListTile(
                          onTap: () {
                            Get.to(ProfileScreen());
                          },
                          leading: const Icon(
                            Icons.av_timer_rounded,
                            color: appBackground,
                          ),
                          title: const Text(
                            "View Profile",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: appBackground),
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: appBackground,
                              )),
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
