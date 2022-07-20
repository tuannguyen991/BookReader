// import 'package:demo_book_reader/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/features/onboarding/onboarding_page.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: titleApp,
      theme: ThemeData(
        primarySwatch: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        // backgroundColor: AppColors.backgroundColor,
        // dialogBackgroundColor: AppColors.backgroundColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              const Size.fromHeight(double48),
            ),
          ),
        ),
      ),
      home: const OnboardingPage(),
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text(titleApp),
      //     actions: [
      //       Builder(
      //         builder: (context) {
      //           return IconButton(
      //             onPressed: () {
      //               context.navigateTo(const AuthorListPage());
      //               // Navigator.push(
      //               //   context,
      //               //   MaterialPageRoute(
      //               //     builder: (context) {
      //               //       return const AuthorListPage();
      //               //     },
      //               //   ),
      //               // );
      //             },
      //             icon: const Icon(Icons.add),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
