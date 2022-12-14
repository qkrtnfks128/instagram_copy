import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_copy/css/theme.dart';
import 'package:instagram_copy/page/profilepage.dart';
import 'package:instagram_copy/page/routepage.dart';
import 'package:instagram_copy/system/cache_clear.dart';
import 'package:http/http.dart' as http;

//firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  CustomImageCache();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  Get.put(MyProfile());
  runApp(
    GetMaterialApp(
      home: const RoutePage(),
      theme: myTheme,
      getPages: [
        GetPage(
            name: '/userProfile',
            page: () => ProfilePage(),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/routePage',
            page: () => RoutePage(),
            transition: Transition.fadeIn)
      ],
    ),
  );
}

class MyProfile extends GetxController {
  RxString myName = 'mangki_pritty'.obs;
  RxInt follower = 100.obs;
  RxBool isFollowClick = false.obs;
  RxList profileImage = [].obs;

  getData() async {
    var result = await http
        .get(Uri.parse('https://codingapple1.github.io/app/profile.json'));
    profileImage.value = jsonDecode(result.body);
    print(profileImage.value);
  }

  void followClick() {
    if (isFollowClick.value) {
      follower.value--;
      isFollowClick.value = false;
    } else {
      follower.value++;
      isFollowClick.value = true;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
}
