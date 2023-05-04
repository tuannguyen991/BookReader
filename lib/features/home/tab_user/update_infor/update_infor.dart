import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/share/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../data/remote/remote.dart';
import 'bloc/update_infor_bloc.dart';

class UpdateInforPage extends StatefulWidget {
  const UpdateInforPage({Key? key}) : super(key: key);

  @override
  State<UpdateInforPage> createState() => _UpdateInforPageState();
}

class _UpdateInforPageState extends State<UpdateInforPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _birthdayController = TextEditingController();

  String? _imagePath;

  final _bloc = UpdateInforBloc(userRepository: locator<UserRepository>());

  @override
  void initState() {
    super.initState();

    _bloc.add(UpdateInforLoaded());
  }

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
    bool isValid = true;
    return Builder(
      builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(double16),
            child: BlocBuilder<UpdateInforBloc, UpdateInforState>(
              builder: (context, state) {
                _firstNameController.text = state.user.firstName;
                _lastNameController.text = state.user.lastName;
                _emailController.text = state.user.email;
                if (_birthdayController.text == '') {
                  _birthdayController.text = state.user.birthDate == null
                      ? ''
                      : DateFormat('yyyy-MM-dd').format(state.user.birthDate!);
                }
                String? imageLink;
                if (state.user.imageLink != '') {
                  imageLink =
                      'https://${Remote.authority}/${Remote.pathUsers}/images/${state.user.imageLink}';
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        BackButton(
                          color: AppColors.secondaryColor,
                        ),
                        horizontalSpace8,
                        const CustomerText(
                          'Thông tin cá nhân',
                          fontSize: fontSize20,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    verticalSpace32,
                    verticalSpace32,
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
                                : ((imageLink == null)
                                    ? const AssetImage(
                                        'assets/image/default.jpeg')
                                    : CachedNetworkImageProvider(
                                        Uri.encodeFull(imageLink),
                                      ) as ImageProvider<Object>),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    verticalSpace32,
                    TextField(
                      // initialValue: '',
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
                          isValid = false;
                          return 'Vui lòng nhập đúng định dạng email';
                        }
                        isValid = true;
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
                          initialDate: state.user.birthDate!,
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
                        if (!isValid) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Thông tin sai định dạng'),
                                content: const Text(
                                    'Vui lòng nhập lại theo đúng định dạng'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      context.off();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        }

                        context.read<UpdateInforBloc>().add(
                              UpdateInfor(
                                firstName: _firstNameController.text,
                                lastName: _lastNameController.text,
                                email: _emailController.text,
                                birthday: _birthdayController.text,
                                imagePath: _imagePath,
                                onSuccess: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title:
                                            const Text('Cập nhật thành công'),
                                        content: null,
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              context.off();
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                onFailed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Cập nhật thất bại'),
                                        content: null,
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              context.off();
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                      },
                      child: const Text('Cập nhật thông tin'),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
