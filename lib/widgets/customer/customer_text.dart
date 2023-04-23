import 'package:flutter/material.dart';

class CustomerText extends StatelessWidget {
  const CustomerText(
    this.text, {
    Key? key,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.maxLines,
    this.isCenter = false,
    this.isEllipsis = true,
  }) : super(key: key);
  final String text;

  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final bool isCenter;
  final bool isEllipsis;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: isCenter ? TextAlign.center : null,
      overflow: isEllipsis ? TextOverflow.ellipsis : null,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
