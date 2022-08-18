
import 'package:flutter/material.dart';
import 'package:instagram_copy/controller/routepage_controller.dart';
import 'package:instagram_copy/page/home.dart';
import 'package:get/get.dart';



class RoutePage extends StatelessWidget {
  const RoutePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //컨트롤러 부착
    final  _pageController=Get.put(RoutePageController());
    return Obx(()=>
        SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Instagram'),
              actions: [
                    IconButton(
                      onPressed: ()  {
                        _pageController.addImg();
                      },
                      icon: const Icon(Icons.add_box_outlined),
                    ),
              ],
            ),
            body: [
              const Home(),
              const Text('샵')
            ][_pageController.tabIndex.value],
            bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Colors.black87,
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
              ],
            ),
          ),
        )
    ) ;

  }
}
