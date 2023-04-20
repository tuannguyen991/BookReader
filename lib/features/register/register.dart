import 'dart:io';

import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/features/home/home_page.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/customer_alert_dialog.dart';
import 'package:demo_book_reader/widgets/customer/customer_clip_rrect.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'bloc/register_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _birthdayController = TextEditingController();

  String? _imagePath;

  final _bloc = RegisterBloc(userRepository: locator<UserRepository>());

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
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
                    const Spacer(),
                  ],
                ),
                Row(
                  children: const [
                    CustomerText(
                      'Đăng ký tài khoản',
                      fontSize: fontSize32,
                      fontWeight: FontWeight.bold,
                    ),
                    Spacer(),
                  ],
                ),
                verticalSpace8,
                Row(
                  children: [
                    CustomerText(
                      'Nhập thông tin tài khoản',
                      color: AppColors.secondaryColor,
                    ),
                    const Spacer(),
                  ],
                ),
                verticalSpace32,
                InkWell(
                  onTap: () async {
                    final picker = ImagePicker();
                    final pickedFile =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      setState(() {
                        _imagePath = pickedFile.path;
                      });
                    }
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: _imagePath != null
                            ? FileImage(File(_imagePath!))
                            : const AssetImage('assets/image/default.jpeg')
                                as ImageProvider<Object>,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                TextField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Họ',
                    hintText: 'Vui lòng nhập họ của bạn',
                  ),
                ),
                TextField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    labelText: 'Tên',
                    hintText: 'Vui lòng nhập tên của bạn',
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value != null && value != '')
                    // ignore: curly_braces_in_flow_control_structures
                    if (!(value.contains('@') && value.contains('.'))) {
                      return 'Vui lòng nhập đúng định dạng email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Vui lòng nhập địa chỉ email',
                  ),
                ),
                TextField(
                  controller: _birthdayController,
                  decoration: const InputDecoration(
                    labelText: 'Ngày sinh',
                    hintText: 'Vui lòng nhập ngày sinh của bạn',
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now(),
                    );

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);

                      setState(() {
                        _birthdayController.text = formattedDate;
                      });
                    }
                  },
                ),
                verticalSpace32,
                ElevatedButton(
                  onPressed: () {
                    context.read<RegisterBloc>().add(
                          Register(
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            email: _emailController.text,
                            birthday: _birthdayController.text,
                            imagePath: _imagePath,
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
                  child: const Text('Đăng ký tài khoản'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class RegisterField extends StatelessWidget {
  const RegisterField({
    Key? key,
    required TextEditingController controller,
    required this.isPassword,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextField(
          obscureText: isPassword ? (state.isObscure ? true : false) : false,
          controller: _controller,
          decoration: InputDecoration(
            labelText: isPassword ? 'Mật khẩu' : 'Tên đăng nhập',
            hintText: isPassword
                ? 'Vui lòng nhập mật khẩu'
                : 'Vui lòng nhập tên đăng nhập',
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      state.isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      context.read<RegisterBloc>().add(RegisterChangeObscure());
                    },
                  )
                : null,
          ),
        );
      },
    );
  }
}
