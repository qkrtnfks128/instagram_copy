import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_copy/css/theme.dart';
import 'package:instagram_copy/page/routepage.dart';
import 'package:instagram_copy/system/cache_clear.dart';



void main() {
  CustomImageCache();
  Get.put(MyProfile());
  runApp(
    GetMaterialApp(
      home:  const RoutePage(),
      theme: myTheme,
    ),
  );
}

class MyProfile extends GetxController{
  RxString myName='mangki_pritty'.obs;
  RxInt follower=100.obs;

  void addFollower(){
    follower.value++;
  }
}