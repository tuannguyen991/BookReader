import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:flutter/material.dart';

// typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  // final RatingChangeCallback onRatingChanged;
  // final Color color;

  const StarRating({
    Key? key,
    this.starCount = 5,
    this.rating = 3,
    // required this.onRatingChanged,
    // required this.color,
  }) : super(key: key);

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_outlined,
        color: AppColors.secondaryBackgroundColor,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = const Icon(
        // size: ,
        Icons.star_half,
        color: AppColors.starColor,
      );
    } else {
      icon = const Icon(
        Icons.star,
        color: AppColors.starColor,
      );
    }
    return InkResponse(
      // onTap: () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        starCount,
        (index) => buildStar(context, index),
      ),
    );
  }
}
