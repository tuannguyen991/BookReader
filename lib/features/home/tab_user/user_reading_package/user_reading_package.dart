import 'package:demo_book_reader/data/repository/reading_package_repository.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/features/home/tab_user/main/util/personal_option_list.dart';
import 'package:demo_book_reader/features/home/tab_user/user_reading_package/bloc/user_reading_package_bloc.dart';
import 'package:demo_book_reader/models/reading_package/reading_package_model.dart';
import 'package:demo_book_reader/models/user/user_model.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/custom_appbar.dart';
import 'package:demo_book_reader/widgets/customer/customer_box_decoration.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
import 'package:demo_book_reader/features/home/tab_user/user_reading_package/widgets/payment_information.dart';
import 'package:demo_book_reader/features/home/tab_user/user_reading_package/widgets/reading_package.dart';
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
  late UserReadingPackageBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = UserReadingPackageBloc(
        user: widget.user,
        readingPackageRepository: locator<ReadingPackageRepository>(),
        userRepository: locator<UserRepository>());
    bloc.add(UserReadingPackageLoaded());
  }

  sendRequest(String readingPackageId, DateTime startDate) {
    bloc.add(UserReadingPackageRequested(
        readingPackageId: readingPackageId, startDate: startDate));
    Navigator.pop(context);
    bloc.add(UserReadingPackageLoaded());
  }

  showPaymentModal(ReadingPackageModel package, DateTime? endDate) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PaymentModal(
                isUsing: widget.user.currentPackage != null,
                package: package,
                endDate: endDate,
                callback: sendRequest)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomAppBarTitle(
            text: userReadingPackageText,
          ),
        ),
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
          Row(),
          buildPersonalInfo(),
          verticalSpace16,
          BlocBuilder<UserReadingPackageBloc, UserReadingPackageState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const CircularProgressIndicator();
              }
              final readingPackageList = state.readingPackageList;
              final currentPackage = state.currentPackage;
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
                        currentPackage != null
                            ? Expanded(
                                child: RichText(
                                  text: TextSpan(
                                      text: 'Bạn đang sử dụng ',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: fontSize16,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: currentPackage.detail.name,
                                            style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        const TextSpan(
                                          text: ', thời hạn tới ',
                                        ),
                                        TextSpan(
                                            text: DateFormat('dd/MM/yyyy')
                                                .format(currentPackage.endDate),
                                            style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ]),
                                ),
                              )
                            : const Expanded(
                                child: Text(
                                  'Bạn chưa đăng ký gói đọc sách nào!\nVui lòng đăng ký để trải nghiệm đầy đủ tính năng trên ứng dụng BookReader.',
                                  style: TextStyle(
                                      fontSize: fontSize16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary_1),
                                ),
                              )
                      ],
                    ),
                  ),
                  currentPackage != null
                      ? Wrap(
                          children: [
                            verticalSpace4,
                            ReadingPackage(
                                package: currentPackage.detail,
                                startDate: currentPackage.startDate,
                                endDate: currentPackage.endDate,
                                callback: showPaymentModal)
                          ],
                        )
                      : Wrap(),
                  verticalSpace4,
                  ...List.generate(
                      readingPackageList.length,
                      (index) => (readingPackageList[index].id !=
                              currentPackage?.detail.id
                          ? ReadingPackage(
                              package: readingPackageList[index],
                              callback: showPaymentModal)
                          : Wrap()))
                ],
              );
            },
          )
        ],
      ),
    ));
  }
}
