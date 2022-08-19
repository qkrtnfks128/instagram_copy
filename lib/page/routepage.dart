
import 'package:flutter/material.dart';
import 'package:instagram_copy/controller/routepage_controller.dart';
import 'package:instagram_copy/page/home.dart';
import 'package:get/get.dart';
import 'package:instagram_copy/page/profilepage.dart';
import 'package:instagram_copy/page/shoppage.dart';
import 'package:instagram_copy/system/notification.dart';



class RoutePage extends StatelessWidget {
  const RoutePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //컨트롤러 부착
    final  _pageController=Get.put(RoutePageController());
    return Obx(()=>
        SafeArea(
          child: Scaffold(
            body: [
              const Home(),
               ShopPage(),
            ][_pageController.tabIndex.value],
            bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black26,
              currentIndex: _pageController.tabIndex.value,
              onTap: (i) {
                _pageController.tabIndex.value = i;
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: '홈', tooltip: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag_outlined),
                    label: '샵',
                    tooltip: ''),
                // BottomNavigationBarItem(
                //     icon: Icon(Icons.person_outline),
                //     label: '프로필',
                //     tooltip: ''),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                showNotification2();
              },child: Icon(Icons.add,color: Colors.white,),
            ),
          ),
        )
    ) ;

  }
}
