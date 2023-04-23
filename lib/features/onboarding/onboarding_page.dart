import 'package:demo_book_reader/features/login/login_page.dart';
import 'package:demo_book_reader/share/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              verticalSpace16,
              CustomerText(
                titleApp,
                fontSize: fontSize56,
                fontWeight: FontWeight.bold,
                isCenter: true,
                color: AppColors.primaryColor,
              ),
              verticalSpace32,
              verticalSpace32,
              Image.asset(
                'assets/image/onboarding.jpg',
              ),
              Image.asset(
                'assets/image/onboarding.jpg',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(double16),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () => context.navigateOff(const LoginPage()),
                child: const Text('Đăng nhập'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
