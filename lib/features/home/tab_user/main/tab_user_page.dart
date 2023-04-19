import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/features/home/tab_user/main/bloc/tab_user_bloc.dart';
import 'package:demo_book_reader/features/home/tab_user/main/util/personal_option_list.dart';
import 'package:demo_book_reader/features/home/tab_user/update_infor/update_infor.dart';
import 'package:demo_book_reader/features/home/tab_user/user_history/user_history_page.dart';
import 'package:demo_book_reader/features/home/tab_user/user_reading_package/user_reading_package.dart';
import 'package:demo_book_reader/models/user/user_model.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/backdrop.dart';
import 'package:demo_book_reader/widgets/background_image.dart';
import 'package:demo_book_reader/widgets/customer/customer_alert_dialog.dart';
import 'package:demo_book_reader/widgets/customer/customer_box_decoration.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
import 'package:demo_book_reader/widgets/greeting.dart';
import 'package:demo_book_reader/widgets/modal_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabUserPage extends StatefulWidget {
  const TabUserPage({Key? key}) : super(key: key);

  @override
  State<TabUserPage> createState() => _TabUserPageState();
}

class _TabUserPageState extends State<TabUserPage> {
  final _bloc = TabUserBloc(
    userRepository: locator<UserRepository>(),
    bookRepository: locator<BookRepository>(),
  );

  @override
  void initState() {
    super.initState();

    _bloc.add(TabUserLoaded());
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
    // percent distance from Top_Screen to Back_Drop
    const percent = 0.325;
    return Stack(
      children: [
        BackgroundImage(context: context),
        Backdrop(context: context, percent: percent),
        SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(
                top: double16,
                left: double16,
                right: double16,
              ),
              child: BlocBuilder<TabUserBloc, TabUserState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const CircularProgressIndicator();
                  }
                  final user = state.user;
                  final readBooks = state.readBooks;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...[
                        Greeting(user: user, isUserTab: true),
                        verticalSpace16,
                        UserBox(user: user),
                        verticalSpace32,
                      ],
                      ...List<Widget>.generate(
                        personalOptionList.length,
                        (index) {
                          final item = personalOptionList[index];
                          late final VoidCallback onTap;
                          switch (item.title) {
                            case userReadingPackageText:
                              onTap = () {
                                context.navigateTo(
                                  UserReadingPackage(user: user),
                                );
                              };
                              break;
                            case userHistoryText:
                              onTap = () {
                                context.navigateTo(UserHistoryPage(
                                  user: user,
                                  readBooks: readBooks,
                                ));
                              };
                              break;
                            case personalInformationText:
                              onTap = () {
                                context.navigateTo(
                                  const UpdateInforPage(),
                                );
                              };
                              break;
                            default:
                              onTap = () {};
                              break;
                          }

                          return Column(
                            children: [
                              ModalItem(
                                icon: item.icon,
                                title: item.title,
                                onTap: onTap,
                              ),
                              if (index < personalOptionList.length - 1)
                                const Divider(),
                            ],
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(double16),
              width: MediaQuery.of(context).size.width,
              child: OutlinedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.logout),
                    horizontalSpace8,
                    CustomerText(
                      'Đăng xuất',
                      fontSize: fontSize16,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        const CustomerAlertDialog(isLogin: false),
                  );
                },
              ),
            )),
      ],
    );
  }
}

class UserBox extends StatelessWidget {
  const UserBox({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(double8),
      decoration: CustomerBoxDecoration.buildBoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: double16,
        isShadow: true,
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Flexible(
              child: UserBoxItem(
                icon: Icons.timer_rounded,
                title: 'Số phút đọc sách',
                content: '${user.totalReadingTime}',
              ),
            ),
            VerticalDivider(color: AppColors.secondaryColor),
            Flexible(
              child: UserBoxItem(
                icon: Icons.book,
                title: 'Sách đã đọc',
                content: '${user.totalReadingBooks}',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserBoxItem extends StatelessWidget {
  const UserBoxItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.content,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(double8),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.secondaryBackgroundColor,
            child: Icon(
              icon,
              color: AppColors.primaryColor,
            ),
          ),
          horizontalSpace8,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomerText(
                title,
                fontSize: fontSize12,
                color: AppColors.secondaryColor,
              ),
              verticalSpace8,
              CustomerText(
                content,
                fontSize: fontSize16,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
