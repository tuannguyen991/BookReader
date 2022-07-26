import 'package:demo_book_reader/theme/constant.dart';
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static MaterialColor primaryColor = const MaterialColor(0xFF4F51B4, colorCodes);
  static MaterialColor secondaryColor = const MaterialColor(0xFF808285, colorCodes);
  static Color secondaryBackgroundColor = secondaryColor.withOpacity(0.1);

  static const starColor = Colors.yellow;
  static const backgroundColor = Colors.white;
  static const titleColor = Colors.black;


  static const a = Color.fromARGB(255, 128, 130, 133);
}