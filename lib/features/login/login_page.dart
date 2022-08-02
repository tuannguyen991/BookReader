import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/features/home/home_page.dart';
import 'package:demo_book_reader/features/login/bloc/login_bloc.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/customer_alert_dialog.dart';
import 'package:demo_book_reader/widgets/customer/customer_clip_rrect.dart';
import 'package:demo_book_reader/widgets/customer/customer_rich_text.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
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
        const percent = 0.2;
        final height = MediaQuery.of(context).size.height * percent;
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(double16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: double45,
                        child: CustomerClipRRect(
                          image: 'assets/image/logo.png',
                          isAssets: true,
                        ),
                      ),
                      horizontalSpace16,
                      CustomerText(
                        titleApp,
                        fontSize: fontSize32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
                const CustomerText(
                  'Đăng nhập',
                  fontSize: fontSize32,
                  fontWeight: FontWeight.bold,
                ),
                verticalSpace8,
                CustomerText(
                  'Nhập tài khoản email của TMT đã cung cấp cho bạn',
                  color: AppColors.secondaryColor,
                ),
                verticalSpace16,
                verticalSpace8,
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
                                  return const CustomerAlertDialog();
                                },
                              );
                            },
                          ),
                        );
                  },
                  child: const Text('Login'),
                ),
                verticalSpace16,
                CustomerRichText(
                  text: 'Lưu ý: ',
                  subText:
                      'Tài khoản email của TMT cung cấp chỉ dành riêng cho nhân viên không dành cho người ngoài',
                  color: AppColors.primaryColor,
                  subColor: AppColors.secondaryColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
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
            // border: const OutlineInputBorder(),
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
