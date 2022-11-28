import 'package:flutter/material.dart';
import 'package:push_notification_practice/services/firebase_push_notification_service.dart';
import 'package:push_notification_practice/services/local_notification_service.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();

    FirebasePushNotificationService.messageOnBackgroundState(context);
    LocalNotificationService.initialize(context);
    FirebasePushNotificationService.messageOnForegroundState();
    FirebasePushNotificationService.messageOnTerminatedState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: const Text("notification will come here"))),
    );
  }
}
