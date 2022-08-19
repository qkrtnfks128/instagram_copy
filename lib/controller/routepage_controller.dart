import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_copy/controller/upload_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
//사진 가져오기
import 'package:image_picker/image_picker.dart';

import '../page/upload.dart';
import '../system/notification.dart';

class RoutePageController extends GetxController{
  ///현재 탭의 위치
  RxInt tabIndex=0.obs;
  ///보여줄 데이터 리스트
  final RxList showList=[].obs;
  ///추가할 이미지 path
  late RxString userImagePath=''.obs;
  ///cache 저장공간
  late final storage;


  saveData(List data) async {
    //이렇게 저장이 된다
    storage.setString('map', jsonEncode(data));
    var result =storage.getString('map');
    //삭제
    // storage.remove('key');
    print(result);

  }

  getData() async {
    storage = await SharedPreferences.getInstance();

    if(storage.getString('map')==null){
      var result = await http
          .get(Uri.parse('https://codingapple1.github.io/app/data.json'));
      if (result.statusCode == 200) {
        ///cache저장
        saveData( jsonDecode(result.body));
          showList.value = jsonDecode(result.body);
      } else {
        throw Exception('실패함ㅅㄱ');
      }
    }
    else{
    }
      showList.value = jsonDecode(storage.getString('map')!);
    print(storage.getString('map'));

  }

  addImg() async{
    ///이미지 선택화면 띄우는 코드
    var picker = ImagePicker();
    XFile? image =
    await picker.pickImage(source: ImageSource.gallery);

    ///이미지 경로 저장
    if (image != null) {
      userImagePath.value = image.path;
      Get.put(UploadController());
      Get.to(Upload(),
      );
    }
  }

  addList(e) {
      showList.addAll(e);
    storage.setString('map', jsonEncode(showList));
    print(storage.getString('map'));
  }

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
    initNotification();
  }

}