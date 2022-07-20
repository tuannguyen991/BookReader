import 'package:flutter/material.dart';

class NavigatorHelper {
  NavigatorHelper._();

  static Future<dynamic> navigateTo(BuildContext context, Widget nextPage) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return nextPage;
        },
      ),
    );
  }

  static Future<dynamic> navigateOff(BuildContext context, Widget nextPage) {
    Navigator.pop(context);
    return NavigatorHelper.navigateTo(context, nextPage);
  }
}