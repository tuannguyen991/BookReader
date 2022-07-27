import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/customer_box_decoration.dart';
import 'package:flutter/material.dart';

class Backdrop extends StatelessWidget {
  const Backdrop({
    Key? key,
    required this.context,
    required this.percent,
  }) : super(key: key);

  final BuildContext context;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * percent,
      left: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: CustomerBoxDecoration.buildBoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: double45,
        ),
      ),
    );
  }
}
