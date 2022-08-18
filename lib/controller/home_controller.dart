import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:instagram_copy/controller/routepage_controller.dart';


class HomeController extends GetxController{
  ///스크롤 컨트롤러
  final  scrollController = ScrollController();
  final routepageController=Get.find<RoutePageController>();


  getData() async {
    var result = await http
        .get(Uri.parse('https://codingapple1.github.io/app/more1.json'));
    late List _showMoreList = [];
    if (result.statusCode == 200) {
        _showMoreList.add(jsonDecode(result.body));
        routepageController.addList(_showMoreList);
    } else {
      throw Exception('실패함ㅅㄱ');
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print('맨 끝입니다');
        getData();
      }
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    scrollController.dispose();
    super.onClose();
  }
}