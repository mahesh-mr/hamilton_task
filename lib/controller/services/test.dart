import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/login_model.dart';
import '../../model/profile_model.dart';
import '../../view/const/const.dart';
import '../../view/const/size.dart';
import '../../view/widgets/custom_appbar.dart';
import '../../view/widgets/custom_listtaile.dart';
import '../../view/widgets/eleveted_button_widget.dart';
import '../controller/restorent_controller.dart';
import 'dio_client/dio_client.dart';

class ProfilesController extends GetxController {
  RxBool loding = true.obs;
  RxList<Profiles> profile = <Profiles>[].obs;
  //LoginModel loginModel = LoginModel();

  Future<List<Profiles>?> getProfileService() async {
    try {
      var data = await ProfileServices.profile();

      loding.value = false;
      return data;
    } catch (e) {
      Get.snackbar('warnig', 'Please check Internet Connection');
      print(e);
      print('catch bloc called');
      loding.value = false;
    }
    return null;
  }

  @override
  void onInit() {
    getProfileService().then((value) => profile.value = value!);
    update();
    super.onInit();
  }
}

class ProfileServices {
  //LoginModel loginModel = LoginModel();
  static Future<List<Profiles>?> profile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //  SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String tk =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuZXdVc2VyIjp7ImNsaWVudF9uYW1lIjoicG9pIiwibWFpbCI6InBvQGdtYWlsLmNvbSIsImNvdW50cnkiOjEsImNsaWVudF9zdGF0dXMiOnRydWUsImNsaWVudF9waG9uZSI6IjIzMTU2NDg5NzAiLCJjbGllbnRfZ2VuZGVyIjowLCJjbGllbnRfaWQiOjIwMjQ4NTN9LCJpYXQiOjE3MDM1ODM3MjF9.k_9tHgj-nZmGsNo9OjCR3hDIC3A_s-K1ef821iZ8P30";
    int? uid = prefs.getInt('clientId');
    print("id : $uid");
    print("tk : $token");
    try {
      var response = await DioClient.dio.get(
        'profiles/get-profiles?ClientID=2024853&userid=2024853',
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      print("res : ${response.data}");
      ProfileModels profileModel = ProfileModels.fromJson(response.data);
      // print("uid : $uid");
      //  String name =profileModel.data![0].clientName ;
      print("name : ${profileModel.data![0].clientName}");
      return profileModel.data;
    } on DioError catch (e) {
      print("6656566565656556565  dist");
      print("${e.response!.data}===========");
      print("${e.message}=fdsfg=fd");
    } catch (e) {
      print("$e");
    }
    return null;
  }
}

class TestPage extends StatelessWidget {
  TestPage({super.key});
  final profielsController = Get.put(ProfilesController());
  final restorentController = Get.put(RestorentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            profielsController.getProfileService();
          },
        ),
        backgroundColor: appBackground,
        body: Column(
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
                child: Obx(() {
                  if (profielsController.loding.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final data = profielsController.profile[0];
                  return Column(
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
                        style:
                            const TextStyle(fontSize: 16, color: appDarkGrey),
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
                            btncolor: appwiteLight,
                            textColor: appBlack,
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
                            btncolor: appwiteLight,
                            textColor: appBlack,
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
                              buildingNmae: data.nameEn!,
                              image: imgUrl + data.logo!,
                              customerNmae:
                                  "${data.branchCount.toString()} Items",
                              type: "0",
                            );
                          },
                        );
                      }))
                    ],
                  );
                }),
              ),
            )
          ],
        ));
  }
}

class ProfileModels {
  String? message;
  bool? success;
  List<Profiles>? data;

  ProfileModels({this.message, this.success, this.data});

  ProfileModels.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    if (json['data'] != null) {
      data = <Profiles>[];
      json['data'].forEach((v) {
        data!.add(new Profiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Profiles {
  int? clientId;
  String? clientName;
  String? clientPhone;
  String? createdDate;
  bool? clientStatus;
  int? clientGender;
  String? password;
  String? mail;
  Null? birthDate;
  int? points;
  Null? longitude;
  Null? latitude;
  int? country;
  Null? savedTime;
  Null? createdMethod;
  Null? userId;
  Null? restId;
  Null? lastSeen;
  Null? avatar;
  int? activationStep;
  int? walletBalance;
  Null? realTimeChannel;
  int? freeQueue;
  Null? subscription;
  Null? subscriptionExpiredOn;
  int? totalQueue;
  bool? addedFreeQueue;
  String? loginPassword;
  bool? hasApp;
  Null? oTP;
  Null? online;
  Null? providerId;
  int? id;
  int? userid;
  String? username;
  Null? bio;
  int? countryId;
  String? countryName;
  bool? countryStatus;
  String? countryCode;
  String? countryCurancy;
  String? countryNameAr;
  String? flag;
  bool? restActive;
  int? length;
  String? prefix;
  String? shortCode;
  Null? ticketActive;
  Null? region;
  List<Setting>? setting;
  Connections? connections;
  Connections? userconnections;
  Followlist? followlist;

  Profiles(
      {this.clientId,
      this.clientName,
      this.clientPhone,
      this.createdDate,
      this.clientStatus,
      this.clientGender,
      this.password,
      this.mail,
      this.birthDate,
      this.points,
      this.longitude,
      this.latitude,
      this.country,
      this.savedTime,
      this.createdMethod,
      this.userId,
      this.restId,
      this.lastSeen,
      this.avatar,
      this.activationStep,
      this.walletBalance,
      this.realTimeChannel,
      this.freeQueue,
      this.subscription,
      this.subscriptionExpiredOn,
      this.totalQueue,
      this.addedFreeQueue,
      this.loginPassword,
      this.hasApp,
      this.oTP,
      this.online,
      this.providerId,
      this.id,
      this.userid,
      this.username,
      this.bio,
      this.countryId,
      this.countryName,
      this.countryStatus,
      this.countryCode,
      this.countryCurancy,
      this.countryNameAr,
      this.flag,
      this.restActive,
      this.length,
      this.prefix,
      this.shortCode,
      this.ticketActive,
      this.region,
      this.setting,
      this.connections,
      this.userconnections,
      this.followlist});

  Profiles.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    clientName = json['client_name'];
    clientPhone = json['client_phone'];
    createdDate = json['created_date'];
    clientStatus = json['client_status'];
    clientGender = json['client_gender'];
    password = json['password'];
    mail = json['mail'];
    birthDate = json['birthDate'];
    points = json['points'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    country = json['country'];
    savedTime = json['savedTime'];
    createdMethod = json['createdMethod'];
    userId = json['userId'];
    restId = json['restId'];
    lastSeen = json['lastSeen'];
    avatar = json['avatar'];
    activationStep = json['activationStep'];
    walletBalance = json['walletBalance'];
    realTimeChannel = json['realTimeChannel'];
    freeQueue = json['freeQueue'];
    subscription = json['subscription'];
    subscriptionExpiredOn = json['subscriptionExpiredOn'];
    totalQueue = json['totalQueue'];
    addedFreeQueue = json['AddedFreeQueue'];
    loginPassword = json['LoginPassword'];
    hasApp = json['hasApp'];
    oTP = json['OTP'];
    online = json['online'];
    providerId = json['providerId'];
    id = json['id'];
    userid = json['Userid'];
    username = json['Username'];
    bio = json['Bio'];
    countryId = json['country_id'];
    countryName = json['country_name'];
    countryStatus = json['country_status'];
    countryCode = json['country_code'];
    countryCurancy = json['country_curancy'];
    countryNameAr = json['country_name_ar'];
    flag = json['flag'];
    restActive = json['restActive'];
    length = json['length'];
    prefix = json['prefix'];
    shortCode = json['shortCode'];
    ticketActive = json['ticketActive'];
    region = json['region'];
    if (json['setting'] != null) {
      setting = <Setting>[];
      json['setting'].forEach((v) {
        setting!.add(new Setting.fromJson(v));
      });
    }
    connections = json['connections'] != null
        ? new Connections.fromJson(json['connections'])
        : null;
    userconnections = json['userconnections'] != null
        ? new Connections.fromJson(json['userconnections'])
        : null;
    followlist = json['followlist'] != null
        ? new Followlist.fromJson(json['followlist'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_id'] = this.clientId;
    data['client_name'] = this.clientName;
    data['client_phone'] = this.clientPhone;
    data['created_date'] = this.createdDate;
    data['client_status'] = this.clientStatus;
    data['client_gender'] = this.clientGender;
    data['password'] = this.password;
    data['mail'] = this.mail;
    data['birthDate'] = this.birthDate;
    data['points'] = this.points;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['country'] = this.country;
    data['savedTime'] = this.savedTime;
    data['createdMethod'] = this.createdMethod;
    data['userId'] = this.userId;
    data['restId'] = this.restId;
    data['lastSeen'] = this.lastSeen;
    data['avatar'] = this.avatar;
    data['activationStep'] = this.activationStep;
    data['walletBalance'] = this.walletBalance;
    data['realTimeChannel'] = this.realTimeChannel;
    data['freeQueue'] = this.freeQueue;
    data['subscription'] = this.subscription;
    data['subscriptionExpiredOn'] = this.subscriptionExpiredOn;
    data['totalQueue'] = this.totalQueue;
    data['AddedFreeQueue'] = this.addedFreeQueue;
    data['LoginPassword'] = this.loginPassword;
    data['hasApp'] = this.hasApp;
    data['OTP'] = this.oTP;
    data['online'] = this.online;
    data['providerId'] = this.providerId;
    data['id'] = this.id;
    data['Userid'] = this.userid;
    data['Username'] = this.username;
    data['Bio'] = this.bio;
    data['country_id'] = this.countryId;
    data['country_name'] = this.countryName;
    data['country_status'] = this.countryStatus;
    data['country_code'] = this.countryCode;
    data['country_curancy'] = this.countryCurancy;
    data['country_name_ar'] = this.countryNameAr;
    data['flag'] = this.flag;
    data['restActive'] = this.restActive;
    data['length'] = this.length;
    data['prefix'] = this.prefix;
    data['shortCode'] = this.shortCode;
    data['ticketActive'] = this.ticketActive;
    data['region'] = this.region;
    if (this.setting != null) {
      data['setting'] = this.setting!.map((v) => v.toJson()).toList();
    }
    if (this.connections != null) {
      data['connections'] = this.connections!.toJson();
    }
    if (this.userconnections != null) {
      data['userconnections'] = this.userconnections!.toJson();
    }
    if (this.followlist != null) {
      data['followlist'] = this.followlist!.toJson();
    }
    return data;
  }
}

class Setting {
  int? id;
  String? country;
  String? language;
  int? termOfCondition;
  int? chatMessages;
  int? notificationSound;
  int? profilePrivate;
  int? queueVisible;
  int? myOrder;
  int? seated;
  int? chatPrivicy;
  int? commentFromAnyone;
  int? notification;
  int? userID;

  Setting(
      {this.id,
      this.country,
      this.language,
      this.termOfCondition,
      this.chatMessages,
      this.notificationSound,
      this.profilePrivate,
      this.queueVisible,
      this.myOrder,
      this.seated,
      this.chatPrivicy,
      this.commentFromAnyone,
      this.notification,
      this.userID});

  Setting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    country = json['Country'];
    language = json['language'];
    termOfCondition = json['Term_Of_Condition'];
    chatMessages = json['Chat_Messages'];
    notificationSound = json['Notification_Sound'];
    profilePrivate = json['Profile_Private'];
    queueVisible = json['Queue_visible'];
    myOrder = json['my_Order'];
    seated = json['Seated'];
    chatPrivicy = json['Chat_Privicy'];
    commentFromAnyone = json['Comment_From_Anyone'];
    notification = json['Notification'];
    userID = json['UserID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Country'] = this.country;
    data['language'] = this.language;
    data['Term_Of_Condition'] = this.termOfCondition;
    data['Chat_Messages'] = this.chatMessages;
    data['Notification_Sound'] = this.notificationSound;
    data['Profile_Private'] = this.profilePrivate;
    data['Queue_visible'] = this.queueVisible;
    data['my_Order'] = this.myOrder;
    data['Seated'] = this.seated;
    data['Chat_Privicy'] = this.chatPrivicy;
    data['Comment_From_Anyone'] = this.commentFromAnyone;
    data['Notification'] = this.notification;
    data['UserID'] = this.userID;
    return data;
  }
}

class Connections {
  int? followList;
  int? blockList;
  int? muteList;

  Connections({this.followList, this.blockList, this.muteList});

  Connections.fromJson(Map<String, dynamic> json) {
    followList = json['follow_list'];
    blockList = json['block_list'];
    muteList = json['mute_list'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['follow_list'] = this.followList;
    data['block_list'] = this.blockList;
    data['mute_list'] = this.muteList;
    return data;
  }
}

class Followlist {
  int? following;
  int? follower;

  Followlist({this.following, this.follower});

  Followlist.fromJson(Map<String, dynamic> json) {
    following = json['following'];
    follower = json['follower'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['following'] = this.following;
    data['follower'] = this.follower;
    return data;
  }
}
