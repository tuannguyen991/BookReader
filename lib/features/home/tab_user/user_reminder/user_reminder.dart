import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/features/home/tab_user/main/util/personal_option_list.dart';
import 'package:demo_book_reader/features/home/tab_user/user_reminder/bloc/user_reminder_bloc.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/custom_appbar.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
import 'package:flutter/material.dart';

class UserReminder extends StatefulWidget {
  const UserReminder({super.key, required this.userId});

  final String userId;

  @override
  State<UserReminder> createState() => _UserReminderState();
}

class _UserReminderState extends State<UserReminder> {
  late UserReminderBloc bloc;
  bool light = true;

  @override
  void initState() {
    super.initState();
    bloc = UserReminderBloc(userRepository: locator<UserRepository>());
    bloc.add(UserReminderLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBarTitle(text: readingReminderText),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_rounded),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          )
        ],
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(double16),
      // child: BlocBuilder<UserReminderBloc, UserReminderState>(
      //   builder: (context, state) {
      //     if (state.isLoading) {
      //       return const CircularProgressIndicator();
      //     }
      //     final reminderList = state.userReminderList;
      //     return Column(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       children: [
      //         ...List.generate(reminderList.length,
      //                 (index) => buildReminderLine(reminderList[index]))
      //       ],
      //     );
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [buildReminderLine()],
      ),
    ));
  }

  Widget buildReminderLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: double16),
          child: CustomerText(
            '00:00',
            color: Colors.black,
            fontSize: fontSize20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Switch(
              activeColor: AppColors.primaryColor,
              value: light,
              onChanged: (bool value) {
                setState(() {
                  light = value;
                });
              },
            ),
            PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (BuildContext context) {
                  return const [
                    PopupMenuItem(
                        value: 1, child: CustomerText('Chỉnh sửa giờ')),
                    PopupMenuItem(
                        value: 2, child: CustomerText('Xoá nhắc nhở')),
                  ];
                })
          ],
        )
      ],
    );
  }
}
