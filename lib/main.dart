import 'package:flutter/material.dart';
import 'package:instagram_copy/css/theme.dart';
import 'package:instagram_copy/page/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//스크롤 다룰때
import 'package:flutter/rendering.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      theme: myTheme,
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ///현재 탭의 상태
  int tab=0;

  late List _showList=[];

  getData() async {
    var result = await http.get( Uri.parse('https://codingapple1.github.io/app/data.json') );
    if (result.statusCode == 200) {
      setState(() {
        _showList=jsonDecode(result.body);
      });

    } else {
      throw Exception('실패함ㅅㄱ');
    }

  }
addList(e){
    setState(() {
      _showList..addAll(e);
      print(_showList.length);
    });
}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Instagram'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.email),
            ),
          ],
        ),
        body:[Home(data:_showList,getMoreList: (e){addList(e);}),Container(child:Text('샵'))][tab],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black87,
          onTap: (i){
            setState(() {
              tab=i;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: '홈',tooltip: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: '샵',tooltip: ''),
          ],
        ),
      ),
    );
  }
}
