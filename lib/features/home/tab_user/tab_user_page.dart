import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/features/home/tab_user/bloc/tab_user_bloc.dart';
import 'package:demo_book_reader/models/user/user_model.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/backdrop.dart';
import 'package:demo_book_reader/widgets/background_image.dart';
import 'package:demo_book_reader/widgets/customer/customer_alert_dialog.dart';
import 'package:demo_book_reader/widgets/customer/customer_box_decoration.dart';
import 'package:demo_book_reader/widgets/greeting.dart';
import 'package:demo_book_reader/widgets/modal_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<Map<String, dynamic>> listModalItem = [
  {
    'icon': Icons.timer_rounded,
    'title': 'Lịch sử đọc sách',
    'onTap': () {},
  },
  {
    'icon': Icons.people,
    'title': 'Thông tin cá nhân',
    'onTap': () {},
  },
  {
    'icon': Icons.timer_rounded,
    'title': 'Nhắc nhở đọc sách',
    'onTap': () {},
  },
  {
    'icon': Icons.timer_outlined,
    'title': 'Góp ý',
    'onTap': () {},
  },
  {
    'icon': Icons.settings,
    'title': 'Cài đặt',
    'onTap': () {},
  },
];

class TabUserPage extends StatefulWidget {
  const TabUserPage({Key? key}) : super(key: key);

  @override
  State<TabUserPage> createState() => _TabUserPageState();
}

class _TabUserPageState extends State<TabUserPage> {
  final _bloc = TabUserBloc(
    userRepository: locator<UserRepository>(),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...[
                    BlocBuilder<TabUserBloc, TabUserState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return const CircularProgressIndicator();
                        }
                        return Greeting(user: state.user, isUserTab: true);
                      },
                    ),
                    verticalSpace16,
                    BlocBuilder<TabUserBloc, TabUserState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return const CircularProgressIndicator();
                        }
                        return UserBox(user: state.user);
                      },
                    ),
                    verticalSpace32,
                  ],
                  ...List<Widget>.generate(
                    listModalItem.length,
                    (index) {
                      final item = listModalItem[index];
                      return Column(
                        children: [
                          ModalItem(
                              icon: item['icon'],
                              title: item['title'],
                              onTap: item['onTap']),
                          if (index < listModalItem.length - 1) const Divider(),
                        ],
                      );
                    },
                  ),
                ],
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
                    Text(
                      'Đăng xuất',
                      style: TextStyle(
                        fontSize: fontSize16,
                        fontWeight: FontWeight.w500,
                      ),
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
                content: '${user.readingTime}',
              ),
            ),
            VerticalDivider(color: AppColors.secondaryColor),
            Flexible(
              child: UserBoxItem(
                icon: Icons.book,
                title: 'Sách đã đọc',
                content: '${user.readBooks}',
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
              Text(
                title,
                style: TextStyle(
                  fontSize: fontSize12,
                  color: AppColors.secondaryColor,
                ),
              ),
              verticalSpace8,
              Text(
                content,
                style: const TextStyle(
                  fontSize: double16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
