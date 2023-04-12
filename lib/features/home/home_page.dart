import 'package:demo_book_reader/features/home/tab_home/tab_home_page.dart';
import 'package:demo_book_reader/features/home/tab_library/tab_library_page.dart';
import 'package:demo_book_reader/features/home/tab_user/main/tab_user_page.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.backgroundColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: 'Thư viện'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), label: 'Người dùng'),
        ],
        onTap: (index) => setState(
          () => _index = index,
        ),
        currentIndex: _index,
      ),
    );
  }

  Widget _buildBody() {
    switch (_index) {
      case 0:
        return const TabHomePage();
      case 1:
        return const TabLibraryPage();
      default:
        return const TabUserPage();
    }
  }
}
