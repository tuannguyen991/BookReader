import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/constant.dart';
import 'customer/customer_text.dart';

class ReadingPackage extends StatelessWidget {
  final String name;
  final String price;

  const ReadingPackage({Key? key, required this.name, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(double12),
      decoration: BoxDecoration(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // description
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomerText(
                name,
                color: Colors.black,
                fontSize: fontSize16,
              ),
              CustomerText(
                '*còn 30 ngày',
                color: Colors.red,
                fontSize: fontSize14,
              )
            ],
          ),
          verticalSpace12,
          CustomerText(
            '${price}/tháng',
            color: AppColors.secondaryColor,
            fontSize: fontSize20,
            fontWeight: FontWeight.bold,
          ),
          // register button
          verticalSpace12,
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
                    child: const CustomerText(
                      'Đăng ký',
                      color: Colors.white,
                      fontSize: fontSize16,
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
