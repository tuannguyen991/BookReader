import 'package:demo_book_reader/models/reading_package/reading_package_model.dart';
import 'package:demo_book_reader/widgets/customer/customer_linear_percent_indicator.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/constant.dart';
import 'customer/customer_text.dart';

class ReadingPackage extends StatelessWidget {
  final ReadingPackageModel package;
  final bool isUsing;

  const ReadingPackage({Key? key, required this.package, this.isUsing = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: double12, bottom: double12),
      padding: EdgeInsets.all(double12),
      decoration: BoxDecoration(
          color: isUsing ? AppColors.primary_4 : AppColors.backgroundColor,
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
              'Tiết kiệm ${package.discountPercentage}%',
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
        // register button
        verticalSpace12,
        isUsing ? const CustomerLinearPercentIndicator(percent: 0.8) : Row(),
        isUsing ? verticalSpace12 : Row(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: double120,
              height: double36,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                  ),
                  onPressed: () {},
                  child: CustomerText(
                    isUsing ? 'Gia hạn' : 'Đăng ký',
                    color: Colors.white,
                    fontSize: fontSize16,
                  )),
            )
          ],
        )
      ]),
    );
  }
}
