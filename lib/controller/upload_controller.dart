import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instagram_copy/controller/routepage_controller.dart';
import 'dart:io';
import 'home_controller.dart';

class UploadController extends GetxController {
  final beforeController=Get.find<RoutePageController>();

  final Rx inputController = TextEditingController().obs;
  late Rx userImage=File('').obs;
  late final RxString lastIndex=''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userImage.value=File(beforeController.userImagePath.value);
    lastIndex.value=(beforeController.showList.length).toString();
    inputController.value.text = '';
  }

}
