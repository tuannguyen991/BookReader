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
    NavigatorHelper.off(context);
    return NavigatorHelper.navigateTo(context, nextPage);
  }

  static Future<void> off(BuildContext context) async {
    Navigator.pop(context);
  }
}
