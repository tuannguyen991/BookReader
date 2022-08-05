import 'package:demo_book_reader/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/features/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';

class CustomerAlertDialog extends StatelessWidget {
  const CustomerAlertDialog({
    Key? key,
    this.isLogin = true,
    this.isUpload = false,
  }) : super(key: key);

  final bool isLogin;
  final bool isUpload;

  @override
  Widget build(BuildContext context) {
    final title = isUpload
        ? 'Successful Upload'
        : (isLogin ? 'Erorr login' : 'Do you want to exit this application?');
    return AlertDialog(
      title: Text(title),
      content: (isLogin && !isUpload) ? const Text('Please enter again') : null,
      actions: isLogin || isUpload
          ? [
              TextButton(
                onPressed: () {
                  context.off();
                },
                child: const Text('OK'),
              ),
            ]
          : [
              TextButton(
                onPressed: () {
                  context.off();
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  context.off();
                  context.navigateOff(const OnboardingPage());
                },
                child: const Text('Yes'),
              ),
            ],
    );
  }
}
