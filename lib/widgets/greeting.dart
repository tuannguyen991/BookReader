import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_book_reader/data/remote/remote.dart';
import 'package:demo_book_reader/models/user/user_model.dart';
import 'package:demo_book_reader/share/enum/ranking.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
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
    String? imageLink;
    if (user.imageLink != '') {
      imageLink =
          'https://${Remote.authority}/${Remote.pathUsers}/images/${user.imageLink}';
    }
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
                              backgroundImage: (imageLink == null)
                                  ? const AssetImage(
                                      'assets/image/default.jpeg')
                                  : CachedNetworkImageProvider(Uri.encodeFull(imageLink))
                                      as ImageProvider<Object>),
                        ),
                        Positioned(
                          bottom: -double32,
                          child: SizedBox(
                            width: double80,
                            child: Image.asset(user.ranking.image),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace16,
                    verticalSpace8,
                    CustomerText(
                      '${user.lastName} ${user.firstName}',
                      isCenter: true,
                      color: AppColors.backgroundColor,
                    ),
                  ],
                ),
              ),
            ]
          : [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  CustomerText(
                    'Xin chào, ${user.firstName}',
                    isCenter: true,
                    color: AppColors.backgroundColor,
                  ),
                  verticalSpace8,
                  const CustomerText(
                    'Hôm nay bạn muốn đọc gì?',
                    isCenter: true,
                    color: AppColors.backgroundColor,
                    fontSize: double24,
                    fontWeight: FontWeight.w500,
                  ),
                ]),
              ),
            ],
    );
  }
}
