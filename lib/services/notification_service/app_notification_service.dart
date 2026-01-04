import 'dart:math';
import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class AppNotificationService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      sound: true,
      providesAppNotificationSettings: true,
      provisional: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
    } else {
      AppSettings.openAppSettings();
    }
  }

  /// Get FCM Token
  Future<String?> getDeviceToken() async {
    return await messaging.getToken();
  }

  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      debugPrint("======${event.toString()}");
    });
  }

  Future<void> saveTokenToBackend() async {
    final token = await getDeviceToken();
    if (token != null) {
     // Get.find<NotificationService>().registerTokenFcm(token: token);
    
    }
  }

  void initLocalNotification(
    BuildContext context,
    RemoteMessage message,
  ) async {
    var androidInitialization =const AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    var iosInitialization =const DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
      android: androidInitialization,
      iOS: iosInitialization,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse: onNotificationTap,
    );
  }

  @pragma('vm:entry-point')
  static void onNotificationTap(NotificationResponse notificationResponse) {
    // Handle notification tap in background
  }

  void firebaseInit() {
    FirebaseMessaging.onMessage.listen((message) {
      if (kDebugMode) {
        debugPrint("Message Id ${message.messageId}");

        // debugPrint("Message Id ${message.}");
      }
      showNotification(message);
    });
  }

  Future<void> showNotification(RemoteMessage message) async {
    if (message.notification == null) {
      if (kDebugMode) {
        debugPrint(
          "RemoteMessage notification is null. Skipping local notification.",
        );
      }
      return;
    }

    AndroidNotificationChannel androidNotificationChannel =
        AndroidNotificationChannel(
          Random.secure().nextInt(1000).toString(),
          "High Importance",
          importance: Importance.max,
        );

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          androidNotificationChannel.id.toString(),
          androidNotificationChannel.name.toString(),
          channelDescription: "Your CHannel description",
          importance: Importance.high,
          priority: Priority.high,
          ticker: 'ticker',
        );

    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentBanner: true,
        );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
        0,
        message.notification?.title ?? '',
        message.notification?.body ?? '',
        notificationDetails,
      );
    });
  }

  Future<void> initLocalNotificationForBackground() async {
    var androidInit = const AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    var iosInit = const DarwinInitializationSettings();
    var settings = InitializationSettings(android: androidInit, iOS: iosInit);

    await _flutterLocalNotificationsPlugin.initialize(settings);
  }
}
