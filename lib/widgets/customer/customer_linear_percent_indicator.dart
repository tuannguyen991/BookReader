// ask toward until meet ancestor has fixed size
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CustomerLinearPercentIndicator extends StatelessWidget {
  const CustomerLinearPercentIndicator({
    Key? key,
    required this.percent,
    this.isLibrary = false,
    this.isUser = false,
  }) : super(key: key);

  final double percent;
  final bool isLibrary;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      padding: isLibrary
          ? const EdgeInsets.symmetric(horizontal: double8)
          : const EdgeInsets.only(right: double8),
      trailing:
          (isLibrary || isUser) ? null : Text('${(percent * 100).toInt()}%'),
      barRadius: const Radius.circular(double8),
      percent: percent,
      backgroundColor: isLibrary
          ? AppColors.backgroundColor
          : AppColors.secondaryBackgroundColor,
      linearGradient: LinearGradient(
        colors: <Color>[
          AppColors.secondaryColor,
          AppColors.primaryColor,
        ],
      ),
    );
  }
}
