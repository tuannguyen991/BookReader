import 'dart:async';

import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/features/home/tab_home/tab_home_page.dart';
import 'package:demo_book_reader/features/home/tab_library/tab_library_page.dart';
import 'package:demo_book_reader/features/home/tab_user/main/tab_user_page.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  late Timer _timer;
  final BookRepository _bookRepository = locator<BookRepository>();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    const time = Duration(seconds: 2);
    _timer = Timer.periodic(time, _showNotification);
  }

  void _showNotification(Timer timer) async {
    String title;
    String body;

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token')!;

    var highLight =
        await _bookRepository.getHighLightNotification(token: token);

    if (highLight.bookName == '') {
      title = 'Nhắc nhở đọc sách';
      body = 'Bạn hãy vào ứng dụng và sử dụng chức năng đọc sách đi nào!!!';
    } else {
      title = highLight.bookName;
      body = 'Ôn lại ghi chú với nội dung: "${highLight.content}" đi nào!!!';
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

    DateFormat dateFormat = DateFormat('dd-MM-yyyy HH:mm:ss');
    // create the notification
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'timer_notification',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.backgroundColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Thư viện',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Người dùng',
          ),
        ],
        onTap: (index) => setState(
          () => _index = index,
        ),
        currentIndex: _index,
      ),
    );
  }

  Widget _buildBody() {
    switch (_index) {
      case 0:
        return const TabHomePage();
      case 1:
        return const TabLibraryPage();
      default:
        return const TabUserPage();
    }
  }
}
