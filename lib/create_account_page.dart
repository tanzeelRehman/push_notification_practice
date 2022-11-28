// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:push_notification_practice/services/api_service.dart';
import 'package:push_notification_practice/services/firebase_auth_service.dart';
import 'package:push_notification_practice/services/firebase_push_notification_service.dart';

import 'models/user_model.dart';

class CreateAccountPage extends StatelessWidget {
  TextEditingController name_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              TextField(
                  controller: email_controller,
                  decoration: const InputDecoration(hintText: "Enter email")),
              const SizedBox(
                height: 20,
              ),
              TextField(
                  controller: name_controller,
                  decoration: const InputDecoration(hintText: "Enter name")),
              const SizedBox(
                height: 20,
              ),
              TextField(
                  controller: password_controller,
                  decoration:
                      const InputDecoration(hintText: "Enter Password")),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: (() async {
                    FirebasePushNotificationService.requestPermission();
                    String? token =
                        await FirebasePushNotificationService.getToken();
                    print(token);

                    try {
                      String res = await AuthServices()
                          .createUserWithEmailAndPass(
                              email: email_controller.text,
                              password: password_controller.text,
                              model: UserModel(
                                  user_name: name_controller.text,
                                  user_email: email_controller.text,
                                  user_device_token: token));

                      if (res == "Sucess") {
                        ApiService.sendPushMessage(token, "Go to profile",
                            "${name_controller.text} just created an Accound");
                        Navigator.pushNamed(context, "Mainpage");
                      } else {
                        print("Data not added");
                      }
                    } catch (e) {
                      print(e);
                    }
                  }),
                  child: const Text("Create account"))
            ],
          ),
        ),
      )),
    );
  }
}
