import 'package:flutter/material.dart';
import 'package:instagram_copy/css/theme.dart';

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
        body:[Container(child:Text('홈')),Container(child:Text('샵'))][tab],
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
