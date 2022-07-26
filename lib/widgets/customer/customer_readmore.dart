import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CustomerReadMoreText extends StatelessWidget {
  const CustomerReadMoreText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: 4,
      style: TextStyle(color: AppColors.secondaryColor),
      moreStyle: TextStyle(
        color: AppColors.primaryColor,
        fontSize: fontSize16,
        fontWeight: FontWeight.w500,
      ),
      lessStyle: TextStyle(
        color: AppColors.primaryColor,
        fontSize: fontSize16,
        fontWeight: FontWeight.w500,
      ),
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Đọc tiếp',
      trimExpandedText: 'Ẩn bớt',
    );
  }
}
