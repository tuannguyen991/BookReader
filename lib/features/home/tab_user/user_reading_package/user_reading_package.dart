import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
import 'package:flutter/material.dart';

class UserReadingPackage extends StatefulWidget {
  const UserReadingPackage({Key? key}) : super(key: key);

  @override
  State<UserReadingPackage> createState() => _UserReadingPackageState();
}

class _UserReadingPackageState extends State<UserReadingPackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(double16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BackButton(
                      color: AppColors.secondaryColor,
                    ),
                    horizontalSpace8,
                    const CustomerText(
                      'Gói đọc sách của tôi',
                      fontSize: fontSize20,

                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Text('Gói đọc sách tháng'),
                Text('Gói đọc sách 3 tháng'),
                Text('Gói đọc sách năm')
              ],
            ),
          ))
    );
  }
}
