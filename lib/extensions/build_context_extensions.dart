import 'package:demo_book_reader/helper/navigator_helper.dart';
import 'package:flutter/material.dart';


extension BuildContextExtensions on BuildContext {
  Future<dynamic> navigateTo(Widget nextPage) {
    return NavigatorHelper.navigateTo(this, nextPage);
  }

  Future<dynamic> navigateOff(Widget nextPage) {
    return NavigatorHelper.navigateOff(this, nextPage);
  }
}
