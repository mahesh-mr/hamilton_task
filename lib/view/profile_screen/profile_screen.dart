import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamilton_task/controller/controller/profile_controller.dart';
import '../../controller/controller/restorent_controller.dart';
import '../const/const.dart';
import '../const/size.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_listtaile.dart';
import '../widgets/eleveted_button_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final profileController = Get.put(ProfileController());
  
  final restorentController = Get.put(RestorentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackground,
      body: Obx(() {
        if (profileController.loding.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final data = profileController.profile[0];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomAppbar(
              leadingType: "1",
              title: "Profile",
              apbarType: "1",
            ),
            h20,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(
                          "https://manofmany.com/wp-content/uploads/2019/04/David-Gandy.jpg"),
                    ),
                    h10,
                    Text(
                      data.clientName!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: appBlack),
                    ),
                    h10,
                    Text(
                      "@${data.username}",
                      style: const TextStyle(fontSize: 16, color: appDarkGrey),
                    ),
                    h10,
                    Text(
                      data.bio ??
                          "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy ",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, color: appGrey),
                    ),
                    h10,
                    SizedBox(
                      height: 30,
                      width: 250,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            "Followers",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: appBlack),
                          ),
                          Text(
                            "Following",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: appBlack),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 250,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "${data.followlist!.follower.toString()}K",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: appBlack),
                          ),
                          Text(
                            "${data.followlist!.following.toString()}K",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: appBlack),
                          ),
                        ],
                      ),
                    ),
                    h10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevetedButtonWidget(
                            onPressed: () {},
                            height: 50,
                            width: 200,
                            title: "Follow"),
                        ElevetedButtonWidget(
                          btncolor: appBlueLight,
                          onPressed: () {},
                          height: 50,
                          width: 100,
                          title: "Message",
                        )
                      ],
                    ),
                    h20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevetedButtonWidget(
                          onPressed: () {},
                          height: 40,
                          width: 50,
                          title: "Rates 132",
                          btncolor: appBackground,
                        ),
                        ElevetedButtonWidget(
                          onPressed: () {},
                          height: 40,
                          width: 50,
                          title: "visited 132",
                          btncolor: appBlueLight,
                        ),
                        ElevetedButtonWidget(
                          onPressed: () {},
                          height: 40,
                          width: 50,
                          title: "fav0rates 132",
                          btncolor: appBackground,
                        )
                      ],
                    ),
                    Expanded(
                        child: ListView.separated(
                      itemCount: 20,
                      separatorBuilder: (context, index) => h10,
                      itemBuilder: (context, index) {
                        return const CustomerTaileWidget(
                          buildingNmae: "jfjhfj",
                          image:
                              "https://i.pngimg.me/thumb/f/720/m2H7K9A0Z5m2G6b1.jpg",
                          customerNmae: "customerNmae",
                          sutitleTwo: "sutitleTwo",
                          type: "0",
                        );
                      },
                    ))
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
