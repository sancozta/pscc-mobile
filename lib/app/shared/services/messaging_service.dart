import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:pscc/app/shared/services/util_service.dart';

class MessagingService {
  final dio = Dio(
    BaseOptions(
      headers: {
        'Content-Type': 'application/json',
        'Authorization': UtilService.getFcmServeKey(),
      },
    ),
  );

  initFirebaseListeners() {
    if (Platform.isIOS) {
      requestPermissionsForNewNotifications();
    }

    FirebaseMessaging.instance.getToken().then((token) {
      print('Firebase Token User Current: ' + token);
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('Got a message whilst in the foreground!');
      if (message.notification != null) {
        await showNotification(message.notification.title, message.notification.body, message.data);
      }
    });
  }

  Future<String> getTokenUserCurrent() {
    return FirebaseMessaging.instance.getToken().then((token) {
      return token;
    }).catchError((e) {
      return '';
    });
  }

  sendMessaging(String token, String title, String body) async {
    await dio.post(
      'https://fcm.googleapis.com/fcm/send',
      data: {
        'notification': {
          'title': title,
          'body': body,
        },
        'priority': 'high',
        'data': {
          'clickaction': 'FLUTTER_NOTIFICATION_CLICK',
        },
        'to': token
      },
    ).then((data) {
      print(data);
    }).catchError((e) {
      print(e);
    });
  }

  requestPermissionsForNewNotifications() async {
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print(settings);
  }

  Future showNotification(String title, String body, Map<String, dynamic> data) async {
    print('PARAMS TITLE: $title');
    print('PARAMS BODY: $body');
    print('PARAMS DATA: $data');

    await Get.dialog(
      SimpleDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 10.0,
              bottom: 10.0,
            ),
            child: Column(
              children: <Widget>[
                Text(
                  body,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
