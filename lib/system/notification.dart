import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'package:get/get.dart';

import '../controller/routepage_controller.dart';

final notifications = FlutterLocalNotificationsPlugin();


//1. 앱로드시 실행할 기본설정
initNotification() async {

  //안드로이드용 아이콘파일 이름
  var androidSetting = AndroidInitializationSettings('app_icon');

  //ios에서 앱 로드시 유저에게 권한요청하려면
  var iosSetting = IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  var initializationSettings = InitializationSettings(
      android: androidSetting,
      iOS: iosSetting
  );
  await notifications.initialize(
    initializationSettings,
    //알림 누를때 함수실행하고 싶으면
    onSelectNotification: (payload){
      final _controller=Get.put(RoutePageController());
      _controller.tabIndex.value=1;
      Get.toNamed('/routePage');
    }
  );
}



//2. 이 함수 원하는 곳에서 실행하면 알림 뜸
showNotification() async {

  var androidDetails = AndroidNotificationDetails(
    '유니크한 알림 채널 ID',
    '알림종류 설명',
    priority: Priority.high,
    importance: Importance.max,
    color: Color.fromARGB(255, 255, 0, 0),
  );

  var iosDetails = IOSNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  // 알림 id, 제목, 내용 맘대로 채우기
  notifications.show(
      1,
      '안녕',
      '샵페이지로 가보십셔~~',
      NotificationDetails(android: androidDetails, iOS: iosDetails),
    payload: '유저에게 보이지 않는 부가정보'
  );
}

//특정시간에 알림 띄우는 법
showNotification2() async {

  tz.initializeTimeZones();

  var androidDetails = const AndroidNotificationDetails(
    '유니크한 알림 ID',
    '알림종류 설명',
    priority: Priority.high,
    importance: Importance.max,
    color: Color.fromARGB(255, 255, 0, 0),
  );
  var iosDetails = const IOSNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );
// tz.TZDateTime.now(tz.local):이폰의 현재시간
  //매일 11시 30분 마다 알림
  notifications.zonedSchedule(
      2,
      '특정시간알림',
      '5초지났다',
      // makeDate(11,30,0),
      tz.TZDateTime.now(tz.local).add(Duration(seconds: 5)),
      NotificationDetails(android: androidDetails, iOS: iosDetails),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time
  );

  //매일 주기적으로 알림띄우기
  // notifications.periodicallyShow(
  //     3,
  //     '제목3',
  //     '내용3',
  //     RepeatInterval.daily,
  //     NotificationDetails(android: androidDetails, iOS: iosDetails),
  //     androidAllowWhileIdle: true
  // );
}

makeDate(hour, min, sec){
  var now = tz.TZDateTime.now(tz.local);
  var when = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, min, sec);
  if (when.isBefore(now)) {
    return when.add(Duration(days: 1));
  } else {
    return when;
  }
}