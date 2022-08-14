import 'package:flutter/material.dart';

final ThemeData myTheme=ThemeData(
  //앱바 테마
    appBarTheme: AppBarTheme(
        color:Colors.white,
        elevation: 1,
        titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),
        actionsIconTheme: IconThemeData(color:Colors.black87)
    ),
    //텍스트테마
    textTheme: TextTheme(
      bodyText2: TextStyle(color:Colors.black),
    ),
    //버튼테마
    buttonTheme: ButtonThemeData(
    )
);