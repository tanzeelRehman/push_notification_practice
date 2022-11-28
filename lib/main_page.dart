import 'package:flutter/material.dart';
import 'package:push_notification_practice/services/firebase_push_notification_service.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();

    FirebasePushNotificationService.getToken();
    FirebasePushNotificationService.messageOnBackgroundState(context);
    // FirebasePushNotificationService.messageOnForegroundState();
    // FirebasePushNotificationService.messageOnTerminatedState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: const Text("Notification will come soon"),
      )),
    );
  }
}
