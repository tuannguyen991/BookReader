import 'package:demo_book_reader/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/features/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        ? 'Tải lên thành công'
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
                onPressed: () async {
                  context.off();
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.clear();
                  // ignore: use_build_context_synchronously
                  context.navigateOff(const OnboardingPage());
                },
                child: const Text('Đồng ý'),
              ),
            ],
    );
  }
}
