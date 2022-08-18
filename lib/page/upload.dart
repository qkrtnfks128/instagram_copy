import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controller/upload_controller.dart';

class Upload extends StatelessWidget {
  const Upload({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final _pageController= Get.find<UploadController>();

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black87,
            ),
          ),
          actions: [
            GetBuilder<UploadController>(
              init:UploadController(),
              builder: (controller) {
                return IconButton(
                  onPressed: () {
                    print('저장하기');
                    UploadValue addList = UploadValue(
                        controller.lastIndex.value,
                        controller.beforeController.userImagePath.value,
                        0,
                        'May 5',
                        controller.inputController.value.text,
                        false,
                        '망키');

                    List mapToList=[addList.toJson()];
                    controller.beforeController.addList(mapToList);
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Colors.black87,
                  ),
                );
              }
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Obx(()=>Image.file(_pageController.userImage.value, fit: BoxFit.cover))),
                const SizedBox(height: 20),
                Obx(()=>
                    TextFormField(
                      controller: _pageController.inputController.value,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                )
              ],
            ),
          ),
        ));
  }
}

class UploadValue {
  String id;
  dynamic image;
  int likes;
  String date;
  String content;
  bool liked;
  String user;

  UploadValue(this.id, this.image, this.likes, this.date, this.content,
      this.liked, this.user);

  UploadValue.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        image = json['image'],
        likes = json['likes'],
        date = json['date'],
        content = json['content'],
        liked = json['liked'],
        user = json['user'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'likes': likes,
        'date': date,
        'content': content,
        'liked': liked,
        'user': user,
      };
}
