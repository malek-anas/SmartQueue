// ignore: avoid_classes_with_only_static_members
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  static Future<void> init() async {
    if (Platform.isIOS) {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      await messaging.requestPermission();
    }
    FirebaseMessaging.instance.subscribeToTopic('topic');
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      //
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print(message.notification?.title);
      print(message.notification?.body);
      // show
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    //
  }
}
