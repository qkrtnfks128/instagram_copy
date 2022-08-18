import 'package:flutter/material.dart';
import 'package:instagram_copy/css/theme.dart';
import 'package:instagram_copy/page/routepage.dart';
import 'package:instagram_copy/system/cache_clear.dart';
import 'package:get/get.dart';



void main() {
  CustomImageCache();
  runApp(
    GetMaterialApp(
      home:  const RoutePage(),
      theme: myTheme,
    ),
  );
}

