import 'package:demo_book_reader/share/functions/navigator_helper.dart';
import 'package:flutter/material.dart';


extension BuildContextExtensions on BuildContext {
  Future<dynamic> navigateTo(Widget nextPage) {
    return NavigatorHelper.navigateTo(this, nextPage);
  }

  Future<dynamic> navigateOff(Widget nextPage) {
    return NavigatorHelper.navigateOff(this, nextPage);
  }

  Future<void> off() {
    return NavigatorHelper.off(this);
  }
}
