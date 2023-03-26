import 'package:demo_book_reader/helper/utils/func.dart';
import 'package:demo_book_reader/models/reading_package/reading_package_model.dart';
import 'package:demo_book_reader/share/enum/button_type.dart';
import 'package:demo_book_reader/widgets/customer/custom_button.dart';
import 'package:demo_book_reader/widgets/customer/customer_linear_percent_indicator.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/constant.dart';
import 'customer/customer_text.dart';

class ReadingPackage extends StatelessWidget {
  final ReadingPackageModel package;
  final DateTime? startDate;
  final DateTime? endDate;

  const ReadingPackage(
      {Key? key, required this.package, this.startDate, this.endDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: double12),
      padding: const EdgeInsets.all(double12),
      decoration: BoxDecoration(
          color: startDate != null
              ? AppColors.primary_4
              : AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(double16),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor,
              offset: const Offset(
                double4,
                double8,
              ),
              blurRadius: double8,
              spreadRadius: 0.0,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            )
          ]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // description
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomerText(
              package.name,
              color: Colors.black,
              fontSize: fontSize16,
              fontWeight: FontWeight.bold,
            ),
            CustomerText(
              package.discountPercentage == 0
                  ? ''
                  : 'Tiết kiệm ${package.discountPercentage}%',
              color: Colors.red,
              fontSize: fontSize14,
            )
          ],
        ),
        verticalSpace12,
        RichText(
            text: TextSpan(
                text:
                    '${(package.price / 100 * (100 - package.discountPercentage)).round()}đ',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: fontSize20,
                  fontWeight: FontWeight.bold,
                ),
                children: [
              TextSpan(
                  text: '/tháng',
                  style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.normal))
            ])),
        verticalSpace12,
        startDate != null
            ? Wrap(
                children: [
                  CustomerLinearPercentIndicator(
                      percent: calculateUsagePercentage(startDate!, endDate!),
                      isUser: true),
                  verticalSpace8,
                  CustomerText(
                      'Còn ${endDate?.difference(DateTime.now()).inDays} ngày',
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                  verticalSpace12
                ],
              )
            : Wrap(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
                text: startDate != null ? 'Gia hạn' : 'Đăng ký',
                size: ButtonSize.compact)
          ],
        )
      ]),
    );
  }
}
