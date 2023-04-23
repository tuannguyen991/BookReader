import 'package:demo_book_reader/theme/constant.dart';
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static MaterialColor primaryColor =
      const MaterialColor(0xFF4F51B4, colorCodes);
  static MaterialColor secondaryColor =
      const MaterialColor(0xFF808285, colorCodes);
  static Color secondaryBackgroundColor = secondaryColor.withOpacity(0.1);

  static const starColor = Colors.yellow;
  static const backgroundColor = Colors.white;
  static const titleColor = Colors.black;
  static const primary_1 = Color(0xFF4F51B4);
  static const primary_4 = Color(0xFFF0F0FF);
  static const neutral1_900 = Color(0xFF1D2328);
  static const white = Colors.white;

  static const a = Color.fromARGB(255, 128, 130, 133);
}
