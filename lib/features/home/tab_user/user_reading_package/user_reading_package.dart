import 'package:demo_book_reader/data/repository/reading_package_repository.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/features/home/tab_user/main/util/personal_option_list.dart';
import 'package:demo_book_reader/features/home/tab_user/user_reading_package/bloc/user_reading_package_bloc.dart';
import 'package:demo_book_reader/models/user/user_model.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/customer_box_decoration.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
import 'package:demo_book_reader/widgets/reading_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class UserReadingPackage extends StatefulWidget {
  const UserReadingPackage({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  State<UserReadingPackage> createState() => _UserReadingPackageState();
}

class _UserReadingPackageState extends State<UserReadingPackage> {
  final bloc = UserReadingPackageBloc(
    userRepository: locator<UserRepository>(),
    readingPackageRepository: locator<ReadingPackageRepository>(),
  );

  @override
  void initState() {
    super.initState();

    bloc.add(UserReadingPackageLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        body: buildBody(),
      ),
    );
  }

  Widget buildPersonalInfo() {
    return Column(
      children: [
        CircleAvatar(
          radius: double60,
          backgroundColor: AppColors.backgroundColor,
          child: CircleAvatar(
            radius: double56,
            backgroundImage: NetworkImage(widget.user.imageLink),
          ),
        ),
        verticalSpace8,
        CustomerText(
          '${widget.user.lastName} ${widget.user.firstName}',
          isCenter: true,
          fontSize: fontSize16,
          fontWeight: FontWeight.bold,
          // color: AppColors.backgroundColor,
        ),
      ],
    );
  }

  Widget buildBody() {
    return SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(double16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              BackButton(
                color: AppColors.secondaryColor,
              ),
              horizontalSpace8,
              const CustomerText(
                userReadingPackageText,
                fontSize: fontSize20,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          verticalSpace8,
          buildPersonalInfo(),
          verticalSpace8,
          BlocBuilder<UserReadingPackageBloc, UserReadingPackageState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const CircularProgressIndicator();
              }
              final userReadingPackage = state.userReadingPackage;
              final readingPackageList = state.readingPackageList;
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(double12),
                    decoration: CustomerBoxDecoration.buildBoxDecoration(
                      color: AppColors.secondaryBackgroundColor,
                      borderRadius: double16,
                    ),
                    child: Row(
                      children: [
                        verticalSpace20,
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                                text: 'Bạn đang sử dụng ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: fontSize16,
                                ),
                                children: [
                                  TextSpan(
                                      text: userReadingPackage
                                          .readingPackage.name,
                                      style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                    text: ', thời hạn tới ',
                                  ),
                                  TextSpan(
                                      text: DateFormat('dd/MM/yyyy').format(
                                          userReadingPackage.startDate!),
                                      style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace8,
                  ...List.generate(readingPackageList.length, (index) {
                    return ReadingPackage(
                      package: readingPackageList[index],
                      isUsing: readingPackageList[index].id ==
                          userReadingPackage.readingPackage.id,
                    );
                  })
                ],
              );
            },
          )
        ],
      ),
    ));
  }
}
