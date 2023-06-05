import 'dart:async';
import 'dart:math';

import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showNotification() async {
  final BookRepository bookRepository = locator<BookRepository>();

  String title;
  String body;

  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');

  if (token == null) {
    return;
  }

  var highLight = await bookRepository.getHighLightNotification(token: token);

  if (highLight.bookName == '') {
    title = 'Tới giờ đọc sách rồi!';
    body = 'Truy cập BookReader và đọc sách thôi nào!!!';
  } else {
    title = 'Sách: ${highLight.bookName}';
    body = 'Highlight: "${highLight.content}"';
  }

  // Initialize the local notifications plugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestPermission();

  const initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // define the notification details
  const androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'channel_id',
    'Channel Name',
    channelDescription: 'Channel Description',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );
  const platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  // create the notification
  await flutterLocalNotificationsPlugin.show(
    Random().nextInt(1000000),
    title,
    body,
    platformChannelSpecifics,
    payload: 'timer_notification',
  );
}

Future<void> scheduleFunctionExecution() async {
  final UserRepository userRepository = locator<UserRepository>();

  final prefs = await SharedPreferences.getInstance();
  String? id = prefs.getString('token');

  if (id == null) return;

  var reminders = await userRepository.getReminder(token: id);

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  flutterLocalNotificationsPlugin.cancelAll();

  final now = DateTime.now();

  for (final time in reminders) {
    final scheduledTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.time.hour,
      time.time.minute,
      // 5,
    );

    final difference = scheduledTime.difference(now);
    final duration = difference > Duration.zero
        ? difference
        : const Duration(days: 1) + difference;

    Timer(duration, () {
      showNotification();
      // scheduleFunctionExecution(times);
    });
  }
}
