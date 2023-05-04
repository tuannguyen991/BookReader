import 'package:flutter/material.dart';

class OptionContent {
  late IconData icon;
  late String title;

  OptionContent(this.icon, this.title);
}

const personalInformationText = 'Thông tin cá nhân';
const userReadingPackageText = 'Gói đọc sách của tôi';
const userHistoryText = 'Lịch sử đọc sách';
const readingReminderText = 'Nhắc nhở đọc sách';
const feedbackText = 'Góp ý';
const settingText = 'Cài đặt';

final List<OptionContent> personalOptionList = [
  OptionContent(Icons.people, personalInformationText),
  OptionContent(Icons.book, userReadingPackageText),
  OptionContent(Icons.history, userHistoryText),
  // OptionContent(Icons.people, readingReminderText),
  // OptionContent(Icons.timer_outlined, feedbackText),
  // OptionContent(Icons.settings, settingText),
];
