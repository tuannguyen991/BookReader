import 'package:demo_book_reader/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/features/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';

class CustomerAlertDialog extends StatelessWidget {
  const CustomerAlertDialog({
    Key? key,
    this.isLogin = true,
  }) : super(key: key);

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(isLogin ? 'Erorr login' : 'Do you want to exit this application?'),
      content: isLogin ? const Text('Please enter again') : null,
      actions: isLogin ? null : [
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
