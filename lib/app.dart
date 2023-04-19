import 'package:demo_book_reader/features/home/home_page.dart';
import 'package:demo_book_reader/features/onboarding/onboarding_page.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final prefs = snapshot.data!;
            String? id = prefs.getString('token');
            return MaterialApp(
              title: titleApp,
              theme: ThemeData(
                  primarySwatch: AppColors.primaryColor,
                  scaffoldBackgroundColor: AppColors.backgroundColor,
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                        const Size.fromHeight(double48),
                      ),
                    ),
                  ),
                  outlinedButtonTheme: OutlinedButtonThemeData(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                        const Size.fromHeight(double48),
                      ),
                      side: MaterialStateProperty.all(
                        BorderSide(color: AppColors.primaryColor),
                      ),
                    ),
                  )),
              home: id != null ? const HomePage() : const OnboardingPage(),
            );
          } else {
            // Handle loading state
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
    });
  }
}
