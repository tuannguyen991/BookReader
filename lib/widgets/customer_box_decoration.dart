import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomerBoxDecoration {
  CustomerBoxDecoration._();

  static BoxDecoration buildBoxDecoration({
    required color,
    required borderRadius,
    isShadow = false,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: isShadow
          ? [
              BoxShadow(
                color: AppColors.secondaryColor,
                spreadRadius: 0,
                blurRadius: 1,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ]
          : [],
    );
  }
}
