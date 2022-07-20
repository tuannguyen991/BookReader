import 'package:demo_book_reader/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/features/home/home_page.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // final _provider = LoginViewModel(loginRepository: LoginRepositoryImpl());

  // final LoginViewModel _loginViewModel =
  //     LoginViewModel(loginRepository: LoginRepositoryImpl());

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
        children: [
          Text(
            titleApp,
            style: TextStyle(
              fontSize: double56,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpace32,
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: 'User name',
              hintText: 'Enter username',
              border: OutlineInputBorder(),
            ),
          ),
          verticalSpace8,
          TextField(
            obscureText: true,
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
              hintText: 'Enter password',
              border: OutlineInputBorder(),
            ),
          ),
          verticalSpace32,
          ElevatedButton(
            onPressed: () {
              context.navigateTo(const HomePage());
            },
            child: const Text('Login'),
          ),
        ],
      ),
    ));
  }

  // Widget _buildChild() {
  //   return Consumer<LoginViewModel>(
  //     builder: (context, value, child) {
  //       if (value.isLoading) {
  //         return const CircularProgressIndicator();
  //       }
  //       return const Text('Login');
  //     },
  //   );
  // }
}
