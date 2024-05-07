import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Notification/Model/Response.dart';
import '';

class NotificationService {
  static String _server_key =
      "AAAA2tmq9Bo:APA91bEZTjghAIpsl_3kSg9GwzivbbWeqyNQA1Z3R_eZyIBs4HXhiX02udPSbQ8Mr0FjJXcD5EglOJFs1ExNcoH9IlL94Kt5RHqoZ4ejIRXM5pd_UZnE3De2z3ux0ro6eLSLKzWWCfQ0";
  static String _url = " https://fcm.googleapis.com/fcm/send";

  static Future<AppNotificationResponse> sendNotification(body) async {
    Map<String, String> _header = {
      "Authorization": "key=${_server_key}",
      "Content-Type": "application/json"
    };
    var _response =
        await http.post(Uri.parse(_url), headers: _header, body: body);
    return AppNotificationResponse.fromJson(jsonDecode(_response.body));
  }

  static listenNotificationMessage() {
    FirebaseMessaging.onMessage.listen((event) {
      print(
          "Event : body  ${event.notification!.body} title : ${event.notification!.title}");
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();
      List list = List.generate(16, (i) => i);
      flutterLocalNotificationsPlugin.show(
          list[0],
          event.notification!.title,
          event.notification!.body,
          NotificationDetails(
              android: AndroidNotificationDetails(
            list[1].toString(),
            list[0].toString(),
            icon: "@mipmap/ic_launcher",
          )));
    });
  }

  static listenBackgroundNotificationMessage() {
    Firebase.initializeApp().then((value) {
      FirebaseMessaging.onBackgroundMessage((message) {
        print(
            "Event : body  background  ${message.notification!.body} title : ${message.notification!.title}");

        FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
            FlutterLocalNotificationsPlugin();
        List list = List.generate(16, (i) => i);
        flutterLocalNotificationsPlugin.show(
            list[0],
            message.notification!.title,
            message.notification!.body,
            NotificationDetails(
                android: AndroidNotificationDetails(
              list[1],
              list[0].toString(),
              icon: "@mipmap/ic_launcher",
            )));

        return;
      } as Future<void> Function(RemoteMessage));
    });
  }

  static listenForgroundNotificationMessage() {
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print(
          "Event : body on Open message ::  ${event.notification!.body} title : ${event.notification!.title}");
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();
      List list = List.generate(16, (i) => i);
      flutterLocalNotificationsPlugin.show(
          list[0],
          event.notification!.title,
          event.notification!.body,
          NotificationDetails(
              android: AndroidNotificationDetails(
            list[1],
            list[0].toString(),
            icon: "@mipmap/ic_launcher",
          )));
    });
  }
}
