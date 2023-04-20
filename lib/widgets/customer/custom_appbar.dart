import 'package:demo_book_reader/theme/constant.dart';
import 'package:flutter/material.dart';

import 'customer_text.dart';

class CustomAppBarTitle extends StatelessWidget {
  final String text;

  const CustomAppBarTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomerText(
      text,
      fontSize: fontSize20,
      fontWeight: FontWeight.w500,
    );
  }
}
