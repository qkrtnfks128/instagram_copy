import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profilepage_controller.dart';
import '../main.dart';

class ProfilePage extends StatelessWidget{
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pageController=Get.put(ProfilePageController());
    final _myprofileController=Get.find<MyProfile>();
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       title: Text(_myprofileController.myName.value),
     ),
     body:Column(
       children: [
         Padding(
           padding: const EdgeInsets.symmetric(vertical:8.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               CircleAvatar(backgroundColor: Colors.red,radius: 25,),
               Obx(()=>Text('팔로워 ${_myprofileController.follower.toString()}명')),
               TextButton(onPressed: (){
                 _myprofileController.addFollower();
               }, child: Text('팔로우'))
             ],
           ),
         ),
         Text('프로필페이지'),
       ],
     )
   );
  }


}