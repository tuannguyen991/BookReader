import 'package:demo_book_reader/feature/book_list/book_list_page.dart';
import 'package:demo_book_reader/features/home/author_list/author_list_page.dart';
import 'package:demo_book_reader/features/home/tab_home/tab_home_page.dart';
import 'package:demo_book_reader/features/home/tab_user/tab_user_page.dart';
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'User'),
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
        // return const TabLibraryPage();
        return const BookListPage();
      default:
        return const TabUserPage();
    }
  }
}
