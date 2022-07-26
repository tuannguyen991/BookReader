import 'package:demo_book_reader/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/features/home/tab_home/home_search/home_search_page.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/customer_box_decoration.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final bool isTextInput;
  const SearchBar({
    Key? key,
    this.isTextInput = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            onPressed: isTextInput
                ? null
                : () => context.navigateTo(const HomeSearchPage()),
          ),
          Flexible(
            child: TextField(
              style: const TextStyle(
                color: AppColors.backgroundColor,
              ),
              onTap: () {
                if (!isTextInput) {
                  context.navigateTo(const HomeSearchPage());
                }
              },

              /// the way to hide Keyboard as click on TextField
              readOnly: isTextInput ? false : true,
              showCursor: isTextInput ? true : false,

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
