import 'package:flutter/material.dart';
import 'package:instagram_copy/css/theme.dart';
import 'package:instagram_copy/page/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

//스크롤 다룰때
import 'package:flutter/rendering.dart';
import 'package:instagram_copy/page/upload.dart';

//사진 가져오기
import 'package:image_picker/image_picker.dart';

//파일 다루는 함수가 들어있는 패키지
import 'dart:io';

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
  int tab = 0;
  late List _showList = [];
  var userImage;
  //저장공간
  late var storage;

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
        setState(() {
          _showList = jsonDecode(result.body);
        });
      } else {
        throw Exception('실패함ㅅㄱ');
      }
    }
    else{


    }
    setState(() {
      _showList = jsonDecode(storage.getString('map')!);
    });
    print(storage.getString('map'));

  }

  addList(e) {
    setState(() {
      _showList..addAll(e);
    });
    if(e.runtimeType==File){
      print('파일형식입니다');
    }
    storage.setString('map', jsonEncode(_showList));
    print(storage.getString('map'));
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
              onPressed: () async {
                ///이미지 선택화면 띄우는 코드
                var picker = ImagePicker();
                XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);

                ///이미지 경로 저장
                if (image != null) {
                  setState(() {
                    userImage = File(image.path);
                    userImage = image.path;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (c) => Upload(
                          userImagePath: userImage,
                          getMoreList: (e) {
                            addList(e);
                          },
                          lastIndex: _showList.length.toString()),
                    ),
                  );
                }
              },
              icon: const Icon(Icons.add_box_outlined),
            ),
          ],
        ),
        body: [
          Home(
              data: _showList,
              getMoreList: (e) {
                addList(e);
              }),
          Container(child: Text('샵'))
        ][tab],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black87,
          onTap: (i) {
            setState(() {
              tab = i;
            });
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
    );
  }
}
