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
        : (isLogin
            ? 'Lỗi đăng nhập'
            : 'Bạn chắc chắn muốn đăng xuất khỏi tài khoản này?');
    return AlertDialog(
      title: Text(title),
      content: (isLogin && !isUpload) ? const Text('Vui lòng nhập lại') : null,
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
                child: const Text('Hủy'),
              ),
              TextButton(
                onPressed: () {
                  context.off();
                  context.navigateOff(const OnboardingPage());
                },
                child: const Text('Đồng ý'),
              ),
            ],
    );
  }
}
