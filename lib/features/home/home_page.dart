import 'package:demo_book_reader/features/home/tab_home/tab_home_page.dart';
import 'package:demo_book_reader/features/home/tab_library/tab_library_page.dart';
import 'package:demo_book_reader/features/home/tab_user/main/tab_user_page.dart';
import 'package:demo_book_reader/features/login/login_page.dart';
import 'package:demo_book_reader/share/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.backgroundColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Thư viện',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Người dùng',
          ),
        ],
        onTap: (index) async {
          if (index != 0) {
            final prefs = await SharedPreferences.getInstance();

            if (prefs.getString('token') == null) {
              // ignore: use_build_context_synchronously
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text(
                    'Bạn chưa đăng nhập',
                  ),
                  content: const Text(
                    'Vui lòng Đăng nhập để sử dụng đầy đủ tính năng',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.off();
                      },
                      child: const Text('Quay lại'),
                    ),
                    TextButton(
                      onPressed: () async {
                        context.off();
                        context.navigateOff(const LoginPage());
                      },
                      child: const Text('Đăng nhập'),
                    ),
                  ],
                ),
              );
              return;
            }
          }
          setState(
            () => _index = index,
          );
        },
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
