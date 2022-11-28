// ignore_for_file: avoid_print, unused_local_variable

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context) {
    //! initializationSettings  for Android, IOS could be add as well
    //? Call this method in main app
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );

    _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        //! NOTE: This {{(onDidReceiveNotificationResponse:)}} method will only be triggered when app is on foreground state
        //* When user click on notification this method will be triggred
        //* Paylod is the data which will be passed from the message
        //? We can send 1 data in the paylod
        String? data = details.payload;
        Navigator.pushNamed(context, data!);
      },
    );
  }

  static void createAndDisplayNotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      //* Notification customization
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          //! To show popup notifications when app is in background state channel id is very important
          //* This must be same in AndroidManifext.xml , here and in the firebase messaging console
          "pushnotificationapp", //? <-- Channel ID
          "pushnotificationapp-channel", //? <-- Channel Name
          importance: Importance.max,
          priority: Priority.high,
        ),
      );

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        //! {[route]} is the Map type data send from the firebase backend
        //* ie {'route':'red'}
        payload: message.data['route'],
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}
