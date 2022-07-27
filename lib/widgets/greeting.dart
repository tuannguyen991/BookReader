import 'package:demo_book_reader/models/user/user_model.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:flutter/material.dart';

class Greeting extends StatelessWidget {
  const Greeting({
    Key? key,
    required this.user,
    this.isUserTab = false,
  }) : super(key: key);

  final UserModel user;
  final bool isUserTab;

  @override
  Widget build(BuildContext context) {
    return Column(
      //// note: use CrossAxisAlignment.stretch has the potential to damage the structure of CircleAvatar
      crossAxisAlignment: CrossAxisAlignment.start,
      children: isUserTab
          ? [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: double60,
                          backgroundColor: AppColors.backgroundColor,
                          child: CircleAvatar(
                            radius: double56,
                            backgroundImage: NetworkImage(user.imageLink),
                          ),
                        ),
                        Positioned(
                          bottom: -double32,
                          child: SizedBox(
                            width: double80,
                            child: Image.network(
                              user.imagaLinkRanking,
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace16,
                    verticalSpace8,
                    CustomerText(text: '${user.lastName} ${user.firstName}'),
                  ],
                ),
              ),
            ]
          : [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  CustomerText(text: 'Xin chào, ${user.firstName}'),
                  verticalSpace8,
                  const CustomerText(
                    text: 'Hôm nay bạn muốn đọc gì?',
                    isTitle: false,
                  ),
                ]),
              ),
            ],
    );
  }
}

class CustomerText extends StatelessWidget {
  const CustomerText({
    Key? key,
    required this.text,
    this.isTitle = true,
  }) : super(key: key);

  final String text;
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: isTitle ? FontWeight.w500 : null,
        fontSize: isTitle ? double24 : null,
        color: AppColors.backgroundColor,
      ),
    );
  }
}
