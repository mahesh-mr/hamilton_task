import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/controller/restorent_controller.dart';
import '../../controller/services/restorent_service.dart';
import '../const/const.dart';
import '../const/size.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_listtaile.dart';
import '../widgets/eleveted_button_widget.dart';

class RestorentScreen extends StatelessWidget {
  RestorentScreen({super.key});
  final restorentController = Get.put(RestorentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      backgroundColor: appBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomAppbar(
            leadingType: "0",
            title: "Restaurant",
            apbarType: "0",
          ),
          h20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevetedButtonWidget(
                  onPressed: () {}, height: 40, width: 100, title: "Dine in"),
              ElevetedButtonWidget(
                onPressed: () {},
                height: 40,
                width: 100,
                title: "Pickup",
                btncolor: appBlueLight,
              )
            ],
          ),
          Expanded(child: Obx(() {
            if (restorentController.loding.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (restorentController.restorent.isEmpty) {
              return const Center(
                child: Text("No Data Available"),
              );
            }

            return ListView.separated(
              itemCount: restorentController.restorent.length,
              separatorBuilder: (context, index) => h10,
              itemBuilder: (context, index) {
                final data = restorentController.restorent[index];
                return CustomerTaileWidget(
                  starRate: data.rating!.toStringAsFixed(1),
                  buildingNmae: data.nameEn!,
                  image: imgUrl + data.logo!,
                  customerNmae: data.foodTypeEN!,
                  sutitleTwo: "${data.branchCount.toString()} Branchs",
                  type: "1",
                );
              },
            );
          }))
        ],
      ),
    );
  }
}
