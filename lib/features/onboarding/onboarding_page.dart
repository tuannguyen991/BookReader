import 'package:demo_book_reader/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/features/login/login_page.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
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
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(double16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              titleApp,
              style: TextStyle(
                fontSize: double56,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Onboarding',
              style: TextStyle(
                fontSize: double32,
                color: AppColors.primaryColor.shade100,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Image.network(
              'https://cdn.pixabay.com/photo/2016/08/24/16/20/books-1617327_960_720.jpg',
            ),
            Image.network(
              'https://cdn.pixabay.com/photo/2016/08/24/16/20/books-1617327_960_720.jpg',
            ),
            // Image.network(
            //   'https://cdn.pixabay.com/photo/2016/08/24/16/20/books-1617327_960_720.jpg',
            // ),
            // Image.network(
            //   'https://cdn.pixabay.com/photo/2016/08/24/16/20/books-1617327_960_720.jpg',
            // ),
            verticalSpace32,
            ElevatedButton(
              onPressed: () => context.navigateTo(const LoginPage()),
              child: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
