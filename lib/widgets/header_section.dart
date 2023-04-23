import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    Key? key,
    required this.title,
    this.subtitle,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: fontSize20,
            fontWeight: FontWeight.w500,
          ),
        ),
        // const Spacer(),
        if (subtitle != null)
          TextButton(
            onPressed: onPressed,
            child: Text(
              subtitle!,
              style: TextStyle(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.normal,
              ),
            ),
          )
      ],
    );
  }
}
