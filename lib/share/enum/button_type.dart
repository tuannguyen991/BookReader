import 'dart:ui';

import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:flutter/material.dart';

enum ButtonType { primary, secondary }

enum ButtonSize { normal, small, compact }

class ButtonColor {
  final Color backgroundColor;
  final Color textColor;

  ButtonColor(this.backgroundColor, this.textColor);
}

class ButtonDimension {
  final double width;
  final double height;

  ButtonDimension(this.width, this.height);
}

Map<ButtonType, ButtonColor> colorVariants = {
  ButtonType.primary: ButtonColor(AppColors.primary_1, AppColors.white),
  ButtonType.secondary: ButtonColor(AppColors.white, AppColors.neutral1_900)
};

Map<ButtonSize, ButtonDimension> dimensionVariants = {
  ButtonSize.compact: ButtonDimension(double120, double36),
  ButtonSize.small: ButtonDimension(double185, double44),
  ButtonSize.normal: ButtonDimension(double.infinity, double36),
};
