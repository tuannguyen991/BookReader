import 'package:demo_book_reader/models/author/author_model.dart';
import 'package:demo_book_reader/models/category/category_model.dart';
import 'package:demo_book_reader/models/user_book/user_book_model.dart';
import 'package:demo_book_reader/share/functions/util_func.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/customer_clip_rrect.dart';
import 'package:demo_book_reader/widgets/customer/customer_linear_percent_indicator.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
import 'package:demo_book_reader/widgets/star_rating.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    Key? key,
    required this.bookItem,
    this.isBookDetail = false,
    this.isGridView = false,
    this.isLibrary = false,
    this.isHistory = false,
  }) : super(key: key);

  final UserBookModel bookItem;
  final bool isBookDetail;
  final bool isGridView;
  final bool isLibrary;
  final bool isHistory;

  @override
  Widget build(BuildContext context) {
    late final List<int> flexList;
    late final SizedBox sizedBox;
    late final int maxLines;
    late final double fontSize;

    late final double percent;

    if (bookItem.numberOfReadPages < 0) {
      percent = 0;
    } else if (bookItem.numberOfReadPages > bookItem.numberOfPages) {
      percent = 1;
    } else {
      percent = bookItem.numberOfReadPages / bookItem.numberOfPages;
    }

    if (isLibrary && isGridView) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                CustomerClipRRect(image: bookItem.imageLink),
                if (bookItem.numberOfReadPages != 0)
                  Padding(
                    padding: const EdgeInsets.only(bottom: double8),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomerLinearPercentIndicator(
                        percent: percent,
                        isLibrary: true,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          verticalSpace4,
          SizedBox(
            height: double80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomerText(
                  bookItem.title,
                  maxLines: 2,
                  fontWeight: FontWeight.w500,
                ),
                CustomerText(
                  bookItem.authors.first.name,
                  color: AppColors.secondaryColor,
                ),
                StarRating(rating: bookItem.averageRating),
              ],
            ),
          ),
        ],
      );
    }

    if (isBookDetail) {
      flexList = [2, 3];
      sizedBox = horizontalSpace16;
      maxLines = 3;
      fontSize = fontSize20;
    } else if (isGridView) {
      flexList = [3, 7];
      sizedBox = horizontalSpace4;
      maxLines = 2;
      fontSize = fontSize14;
    } else if (isHistory) {
      flexList = [1, 6];
      sizedBox = horizontalSpace8;
      maxLines = 1;
      fontSize = fontSize14;
    } else if (isLibrary) {
      flexList = [1, 5];
      sizedBox = horizontalSpace8;
      maxLines = 1;
      fontSize = fontSize14;
    } else {
      flexList = [1, 4];
      sizedBox = horizontalSpace8;
      maxLines = 1;
      fontSize = fontSize14;
    }

    return Row(
      crossAxisAlignment:
          isBookDetail ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: flexList[0],
          child: CustomerClipRRect(image: bookItem.imageLink),
        ),
        sizedBox,
        Flexible(
          flex: flexList[1],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: isBookDetail
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              CustomerText(
                bookItem.title,
                maxLines: maxLines,
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
              ),
              verticalSpace4,
              Builder(builder: (context) {
                final list = limitCharacters(list: bookItem.authors, limit: 32);
                return CustomerText(
                  (list.isNotEmpty) ? list : 'No author',
                  color: AppColors.secondaryColor,
                );
              }),
              verticalSpace4,
              if (!isGridView && !isHistory)
                StarRating(rating: bookItem.averageRating),
              verticalSpace4,
              if (isBookDetail)
                Row(
                  children: const [
                    // Icon(
                    //   Icons.remove_red_eye_outlined,
                    //   color: AppColors.secondaryColor,
                    //   size: 16,
                    // ),
                    horizontalSpace4,
                    // CustomerText(
                    //   '${'bookItem.view'} lượt xem',
                    //   color: AppColors.secondaryColor,
                    // ),
                  ],
                ),
              if (!isGridView &&
                  !isHistory &&
                  (bookItem.numberOfReadPages != 0)) ...[
                // verticalSpace4,
                // ask toward until meet ancestor has fixed size
                CustomerLinearPercentIndicator(
                  percent: percent,
                ),
              ],
              // if (isHistory)
              //   CustomerText(
              //     DateFormat('dd/MM/yyyy').format(bookItem.lastRead!),
              //     color: AppColors.secondaryColor,
              //   )
            ],
          ),
        ),
      ],
    );
  }
}

class AuthorItem extends StatelessWidget {
  const AuthorItem({
    Key? key,
    required this.authorItem,
    this.isSearch = false,
  }) : super(key: key);

  final AuthorModel authorItem;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    late final List<int> flexList;
    late final SizedBox sizedBox;

    if (isSearch) {
      flexList = [1, 5];
      sizedBox = horizontalSpace8;
    } else {
      flexList = [0, 0];
      sizedBox = verticalSpace8;
    }

    if (isSearch) {
      return Row(
        children: [
          Flexible(
            flex: flexList[0],
            fit: FlexFit.tight,
            child: CircleAvatar(
              backgroundImage: NetworkImage(authorItem.imageLink),
            ),
          ),
          sizedBox,
          Flexible(
            flex: flexList[1],
            fit: FlexFit.tight,
            child: CustomerText(authorItem.name, fontWeight: FontWeight.w500),
          ),
        ],
      );
    }
    return SizedBox(
      width: double88,
      child: Column(
        children: [
          CircleAvatar(backgroundImage: NetworkImage(authorItem.imageLink)),
          sizedBox,
          CustomerText(
            authorItem.name,
            isCenter: true,
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.categoryItem,
    this.isSearch = false,
  }) : super(key: key);

  final CategoryModel categoryItem;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    late final List<int> flexList;
    late final SizedBox sizedBox;

    sizedBox = horizontalSpace8;

    if (isSearch) {
      flexList = [1, 5];
    } else {
      flexList = [0, 0];
    }

    return Row(
      children: [
        isSearch
            ? Flexible(
                flex: flexList[0],
                fit: FlexFit.tight,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(categoryItem.imageLink),
                ),
              )
            : CircleAvatar(
                backgroundImage: NetworkImage(categoryItem.imageLink),
              ),
        sizedBox,
        isSearch
            ? Flexible(
                flex: flexList[1],
                fit: FlexFit.tight,
                child: CustomerText(
                  categoryItem.name,
                  fontWeight: FontWeight.w500,
                ),
              )
            : CustomerText(
                categoryItem.name,
                fontWeight: FontWeight.w500,
              ),
      ],
    );
  }
}
