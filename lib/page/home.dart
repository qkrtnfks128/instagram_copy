import 'package:flutter/material.dart';
import 'package:instagram_copy/page/profilepage.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:io';

import '../controller/home_controller.dart';
import '../controller/routepage_controller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pageController = Get.put(HomeController());
    final _routePageController = Get.find<RoutePageController>();

    return Obx(
      () => _routePageController.showList.isNotEmpty
          ? Scaffold(
              appBar: AppBar(
                title: const Text('Instagram'),
                actions: [
                  IconButton(
                    onPressed: () {
                      _routePageController.addImg();
                    },
                    icon: const Icon(Icons.add_box_outlined),
                  ),
                ],
              ),
              body: Obx(
                () => ListView.builder(
                  controller: _pageController.scrollController,
                  itemCount: _routePageController.showList.length,
                  itemBuilder: (c, i) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _routePageController.showList[i]['image']
                                .contains('https://')
                            ? CachedNetworkImage(
                                imageUrl: _routePageController.showList[i]
                                    ['image'],
                                height: 300,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                File(_routePageController.showList[i]['image']),
                                height: 300,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          '좋아요 ${_routePageController.showList[i]['likes']}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.toNamed('/userProfile');
                            },
                            child: Text(
                                '${_routePageController.showList[i]['user']}')),
                        Text('${_routePageController.showList[i]['content']}'),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
          : const Center(
              child: Padding(
                padding: EdgeInsets.all(100),
                child: LoadingIndicator(
                  indicatorType: Indicator.ballRotateChase,

                  /// Optional, the stroke backgroundColor
                ),
              ),
            ),
    );
  }
}
