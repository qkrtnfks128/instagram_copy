import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profilepage_controller.dart';
import '../main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pageController = Get.put(ProfilePageController());
    final _myprofileController = Get.find<MyProfile>();
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(_myprofileController.myName.value),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ProfileHeader(),
            ),
            SliverGrid(
              delegate: SliverChildListDelegate([
                for (int i = 0;
                    i < _myprofileController.profileImage.length;
                    i++)
                  Image.network(
                    _myprofileController.profileImage[i],
                    height: 200,
                  )
              ]),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                childAspectRatio: 1 / 1, //item 의 가로 1, 세로 1 의 비율
                mainAxisSpacing: 10, //수평 Padding
                crossAxisSpacing: 10, //수직 Padding
              ),
            ),
          ],
        ));
  }
}

class ProfileHeader extends StatelessWidget {
  final _myprofileController = Get.find<MyProfile>();

  ProfileHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: Colors.red,
            radius: 25,
          ),
          Obx(() => Text('팔로워 ${_myprofileController.follower.toString()}명')),
          TextButton(
              onPressed: () {
                _myprofileController.followClick();
              },
              child: Text('팔로우'))
        ],
      ),
    );
  }
}
