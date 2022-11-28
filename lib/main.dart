import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:push_notification_practice/main_page.dart';
import 'package:push_notification_practice/red_page.dart';
import 'package:push_notification_practice/create_account_page.dart';
import 'package:push_notification_practice/services/firebase_push_notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebasePushNotificationService.requestPermission();

  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  runApp(const MyApp());
}

Future<void> backgroundHandler(RemoteMessage message) async {
  print("Handling a background message ${message.messageId}");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: CreateAccountPage(),
      routes: {
        "profile": (context) => const ProfilePage(),
        "Mainpage": (context) => const MainPage(),
      },
    );
  }
}
