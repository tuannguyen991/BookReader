import 'package:demo_book_reader/models/author/author_model.dart';
import 'package:demo_book_reader/models/book/book_model.dart';
import 'package:demo_book_reader/models/category/category_model.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/customer_clip_rrect.dart';
import 'package:demo_book_reader/widgets/customer/customer_linear_percent_indicator.dart';
import 'package:demo_book_reader/widgets/star_rating.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    Key? key,
    required this.bookItem,
    this.isBookDetail = false,
    this.isGridView = false,
    this.isLibrary = false,
  }) : super(key: key);

  final BookModel bookItem;
  final bool isBookDetail;
  final bool isGridView;
  final bool isLibrary;

  @override
  Widget build(BuildContext context) {
    late final List<int> flexList;
    late final SizedBox sizedBox;
    late final int maxLines;
    late final double fontSize;

    if (isLibrary && isGridView) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                CustomerClipRRect(image: bookItem.imageLink),
                if (bookItem.lastPage != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: double8),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomerLinearPercentIndicator(
                        percent: bookItem.lastPage! / bookItem.pageCount,
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
                Text(
                  bookItem.title,
                  maxLines: 2,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // verticalSpace4,
                Text(
                  bookItem.authorList.first.name,
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                  ),
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
              Text(
                bookItem.title,
                maxLines: maxLines,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
              verticalSpace4,
              Text(
                bookItem.authorList.first.name,
                style: TextStyle(
                  color: AppColors.secondaryColor,
                ),
              ),
              verticalSpace4,
              if (!isGridView) StarRating(rating: bookItem.averageRating),
              verticalSpace4,
              if (isBookDetail)
                Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye_outlined,
                      color: AppColors.secondaryColor,
                      size: 16,
                    ),
                    horizontalSpace4,
                    Text(
                      '${bookItem.view} lượt xem',
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ],
                ),
              if (!isGridView && (bookItem.lastPage != null)) ...[
                // verticalSpace4,
                // ask toward until meet ancestor has fixed size
                CustomerLinearPercentIndicator(
                  percent: bookItem.lastPage! / bookItem.pageCount,
                ),
              ],
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
            child: Text(
              authorItem.name,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      );
    }
    return SizedBox(
      width: double80,
      child: Column(
        children: [
          CircleAvatar(backgroundImage: NetworkImage(authorItem.imageLink)),
          sizedBox,
          Text(
            authorItem.name,
            textAlign: TextAlign.center,
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
                child: Text(
                  categoryItem.name,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              )
            : Text(
                categoryItem.name,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
      ],
    );
  }
}
