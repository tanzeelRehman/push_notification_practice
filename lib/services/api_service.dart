import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static void sendPushMessage(String token, String body, String title) async {
    try {
      await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: <String, String>{
            "Content-Type": "application/json",
            "Authorization":
                "key=AAAAlIvOTKI:APA91bF7paXqq3-hizn0avsZlNZAZjR-n7Fw7WhU9X394ryyGwBhpermGsscjvRjeA_AjV8295ZAvQmwkDNyrs47n89giTHwg0xzjoOCvYTng0LYDs5D6TuB7dbK87ZGHy4aw3DGwwqK"
          },
          body: jsonEncode(<String, dynamic>{
            "to": token,
            "notification": {
              "body": body,
              "title": title,
              "android_channel_id": "pushnotificationapp",
              "sound": false
            },
            "data": {"route": "profile"}
          }));
      print("Notificationt Sent");
    } catch (e) {
      print("Cant send the notification");
    }
  }
}
