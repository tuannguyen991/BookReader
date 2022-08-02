import 'package:flutter/material.dart';

class CustomerRichText extends StatelessWidget {
  const CustomerRichText({
    Key? key,
    required this.text,
    required this.subText,
    required this.color,
    required this.subColor,
  }) : super(key: key);

  final String text;
  final String subText;
  final Color color;
  final Color subColor;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: TextStyle(color: color),
          ),
          TextSpan(
            text: subText,
            style: TextStyle(color: subColor),
          )
        ],
      ),
    );
  }
}
