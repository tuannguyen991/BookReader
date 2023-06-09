import 'package:demo_book_reader/features/home/tab_home/home_search/bloc/home_search_bloc.dart';
import 'package:demo_book_reader/features/home/tab_home/home_search/home_search_page.dart';
import 'package:demo_book_reader/share/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/customer_box_decoration.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
    this.isTextInput = true,
    this.bloc,
  }) : super(key: key);

  final bool isTextInput;
  final HomeSearchBloc? bloc;

  @override
  Widget build(BuildContext context) {
    final VoidCallback onTap = isTextInput
        ? () {
            showSearch(
              context: context,
              delegate: MySearchDelegate(bloc: bloc!),
            );
          }
        : () => context.navigateTo(const HomeSearchPage());

    return Container(
      decoration: CustomerBoxDecoration.buildBoxDecoration(
        color: AppColors.secondaryBackgroundColor,
        borderRadius: double24,
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: AppColors.secondaryColor,
            ),
            onPressed: onTap,
          ),
          Flexible(
            child: TextField(
              style: const TextStyle(
                color: AppColors.backgroundColor,
              ),
              onTap: onTap,

              /// the way to hide Keyboard as click on TextField
              // readOnly: isTextInput ? false : true,
              // showCursor: isTextInput ? true : false,
              readOnly: true,
              showCursor: false,

              decoration: InputDecoration(
                hintText: 'Tìm kiếm tên sách, chủ đề, tác giả',
                border: const UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintStyle: TextStyle(
                  color: AppColors.secondaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
