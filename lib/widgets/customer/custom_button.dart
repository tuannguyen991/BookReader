import 'package:demo_book_reader/share/enum/button_type.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final ButtonType? type;
  final ButtonSize? size;
  final VoidCallback onPressed;

  const CustomButton(
      {Key? key,
      required this.text,
      this.type = ButtonType.primary,
      this.size = ButtonSize.normal,
      required this.onPressed})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dimensionVariants[widget.size]?.width,
      height: dimensionVariants[widget.size]?.height,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorVariants[widget.type]?.backgroundColor,
          ),
          onPressed: widget.onPressed,
          child: CustomerText(
            widget.text,
            color: colorVariants[widget.type]?.textColor,
            fontSize: fontSize16,
          )),
    );
  }
}
