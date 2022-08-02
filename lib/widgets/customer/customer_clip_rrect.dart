import 'package:demo_book_reader/theme/constant.dart';
import 'package:flutter/material.dart';

class CustomerClipRRect extends StatelessWidget {
  const CustomerClipRRect({
    Key? key,
    required this.image,
    this.borderRadius = double8,
    this.isAssets = false,
  }) : super(key: key);

  final String image;
  final double borderRadius;
  final bool isAssets;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: isAssets
          ? Image.asset(
              image,
              fit: BoxFit.cover,
            )
          : Image.network(
              image,
              fit: BoxFit.cover,
            ),
    );
  }
}
