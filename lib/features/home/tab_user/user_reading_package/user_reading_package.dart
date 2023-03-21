import 'package:demo_book_reader/features/home/tab_user/main/util/personal_option_list.dart';
import 'package:demo_book_reader/models/user/user_model.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
import 'package:demo_book_reader/widgets/reading_package.dart';
import 'package:flutter/material.dart';

class UserReadingPackage extends StatefulWidget {
  const UserReadingPackage({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  State<UserReadingPackage> createState() => _UserReadingPackageState();
}

class _UserReadingPackageState extends State<UserReadingPackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      padding: const EdgeInsets.all(double16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              BackButton(
                color: AppColors.secondaryColor,
              ),
              horizontalSpace8,
              const CustomerText(
                userReadingPackageText,
                fontSize: fontSize20,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          verticalSpace16,
          CircleAvatar(
            radius: double60,
            backgroundColor: AppColors.backgroundColor,
            child: CircleAvatar(
              radius: double56,
              backgroundImage: NetworkImage(widget.user.imageLink),
            ),
          ),
          verticalSpace16,
          CustomerText(
            '${widget.user.lastName} ${widget.user.firstName}',
            isCenter: true,
            fontSize: fontSize16,
            fontWeight: FontWeight.bold,
            // color: AppColors.backgroundColor,
          ),
          verticalSpace20,
          const ReadingPackage(name: 'Gói đọc sách tháng', price: '50.000đ'),
          verticalSpace28,
          const ReadingPackage(name: 'Gói đọc sách 3 tháng', price: '126.000đ'),
          verticalSpace28,
          const ReadingPackage(name: 'Gói đọc sách năm', price: '450.000đ'),
        ],
      ),
    )));
  }
}
