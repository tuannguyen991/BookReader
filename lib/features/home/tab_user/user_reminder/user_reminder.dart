import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/features/home/tab_user/main/util/personal_option_list.dart';
import 'package:demo_book_reader/features/home/tab_user/user_reminder/bloc/user_reminder_bloc.dart';
import 'package:demo_book_reader/models/reminder/reminder_model.dart';
import 'package:demo_book_reader/share/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/custom_appbar.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class UserReminder extends StatefulWidget {
  const UserReminder({super.key});

  @override
  State<UserReminder> createState() => _UserReminderState();
}

class _UserReminderState extends State<UserReminder> {
  late UserReminderBloc bloc;
  bool light = true;
  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    bloc = UserReminderBloc(userRepository: locator<UserRepository>());
    bloc.add(UserReminderLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomAppBarTitle(text: readingReminderText),
          actions: [
            BlocBuilder<UserReminderBloc, UserReminderState>(
                builder: (context, state) => IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        showTimePickerModalBottomSheet(context);
                      },
                    ))
          ],
        ),
        body: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: double16),
          child: BlocBuilder<UserReminderBloc, UserReminderState>(
              builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            final reminderList = state.userReminderList;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...List.generate(reminderList.length,
                    (index) => buildReminderLine(reminderList[index]))
              ],
            );
          })),
    ));
  }

  Widget buildReminderLine(ReminderModel reminderModel) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: double16),
      decoration: BoxDecoration(
        color: reminderModel.isDefault
            ? AppColors.primary_4
            : AppColors.backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: double16),
            child: CustomerText(reminderModel.time.format(context),
                color: Colors.black, fontSize: fontSize20),
          ),
          reminderModel.isDefault
              ? buildChip('Mặc định')
              : BlocBuilder<UserReminderBloc, UserReminderState>(
                  builder: (context, state) {
                  return Row(
                    children: [
                      Switch(
                        activeColor: AppColors.primaryColor,
                        value: reminderModel.isActive,
                        onChanged: (bool value) {
                          setState(() {
                            light = value;
                          });
                          context.read<UserReminderBloc>().add(
                              UserReminderUpdateRequested(
                                  reminderId: reminderModel.id,
                                  time: reminderModel.time,
                                  isActive: light));
                        },
                      ),
                      PopupMenuButton(
                          icon: const Icon(Icons.more_vert),
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem(
                                  value: 1,
                                  child: const CustomerText('Chỉnh sửa giờ'),
                                  onTap: () {
                                    // TODO: will check for new Flutter fix-bug release
                                    // Pull Request: https://github.com/flutter/flutter/pull/127446
                                    showTimePickerModalBottomSheet(
                                        context,
                                        reminderModel.id,
                                        reminderModel.isActive);
                                  }),
                              PopupMenuItem(
                                value: 2,
                                child: const CustomerText('Xoá nhắc nhở'),
                                onTap: () {
                                  context.read<UserReminderBloc>().add(
                                      UserReminderDeleteRequested(
                                          reminderId: reminderModel.id));
                                },
                              ),
                            ];
                          })
                    ],
                  );
                })
        ],
      ),
    );
  }

  Widget buildChip(String label) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(
          color: AppColors.white,
        ),
      ),
      backgroundColor: AppColors.primary_1,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding:
          const EdgeInsets.symmetric(vertical: double8, horizontal: double4),
    );
  }

  showTimePickerModalBottomSheet(BuildContext context,
      [String? reminderId, bool? isActive]) {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(double16),
          topRight: Radius.circular(double16),
        ),
      ),
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: bloc,
          child: Builder(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(double16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CustomerText(
                      'Chọn thời gian',
                      fontSize: fontSize20,
                      fontWeight: FontWeight.w500,
                    ),
                    verticalSpace16,
                    TimePickerSpinner(
                      spacing: double16,
                      minutesInterval: 1,
                      is24HourMode: false,
                      normalTextStyle: const TextStyle(
                          fontSize: fontSize16, color: Colors.black),
                      highlightedTextStyle: const TextStyle(
                          fontSize: fontSize16,
                          color: AppColors.primary_1,
                          fontWeight: FontWeight.bold),
                      onTimeChange: (time) {
                        setState(() {
                          dateTime = time;
                        });
                      },
                    ),
                    verticalSpace16,
                    ElevatedButton(
                        onPressed: () {
                          context.off();
                          reminderId == null
                              ? context
                                  .read<UserReminderBloc>()
                                  .add(UserReminderNewRequested(time: dateTime))
                              : context.read<UserReminderBloc>().add(
                                  UserReminderUpdateRequested(
                                      reminderId: reminderId,
                                      isActive: isActive!,
                                      time: TimeOfDay.fromDateTime(dateTime)));
                        },
                        child: const CustomerText(
                          'Xác nhận',
                          fontSize: fontSize16,
                          fontWeight: FontWeight.w500,
                        ))
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
