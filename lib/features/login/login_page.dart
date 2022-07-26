import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/features/home/home_page.dart';
import 'package:demo_book_reader/features/login/bloc/login_bloc.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _bloc = LoginBloc(userRepository: locator<UserRepository>());

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Builder(
      builder: (context) {
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
                LoginField(controller: _usernameController, isPassword: false),
                verticalSpace8,
                LoginField(controller: _passwordController, isPassword: true),
                verticalSpace32,
                ElevatedButton(
                  onPressed: () {
                    context.read<LoginBloc>().add(
                          Login(
                            username: _usernameController.text,
                            password: _passwordController.text,
                            onSuccess: () {
                              context.navigateOff(const HomePage());
                            },
                            onFailed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    title: Text('Erorr login'),
                                    content: Text('Please enter again'),
                                  );
                                },
                              );
                            },
                          ),
                        );
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        );
      },
    );
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

class LoginField extends StatelessWidget {
  const LoginField({
    Key? key,
    required TextEditingController controller,
    required this.isPassword,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextField(
          obscureText: isPassword ? (state.isObscure ? true : false) : false,
          controller: _controller,
          decoration: InputDecoration(
            labelText: isPassword ? 'Password' : 'Username',
            hintText: isPassword ? 'Enter password' : 'Enter user name',
            border: const OutlineInputBorder(),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      state.isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      context.read<LoginBloc>().add(LoginChangeObscure());
                    },
                  )
                : null,
          ),
        );
      },
    );
  }
}
