import 'package:flutter/material.dart';

class OptionContent {
  late IconData icon;
  late String title;

  OptionContent(this.icon, this.title);
}

const personalInformation = 'Thông tin cá nhân';
const userReadingPackage = 'Gói đọc sách của tôi';
const userHistory = 'Lịch sử đọc sách';
const readingReminder = 'Nhắc nhở đọc sách';
const feedback = 'Góp ý';
const setting = 'Cài đặt';

final List<OptionContent> personalOptionList = [
  OptionContent(Icons.people, personalInformation),
  OptionContent(Icons.book, userReadingPackage),
  OptionContent(Icons.history, userHistory),
  OptionContent(Icons.people, readingReminder),
  OptionContent(Icons.timer_outlined, feedback),
  OptionContent(Icons.settings, setting),
];
