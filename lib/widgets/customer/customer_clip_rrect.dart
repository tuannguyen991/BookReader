import 'package:demo_book_reader/theme/constant.dart';
import 'package:flutter/material.dart';

class CustomerClipRRect extends StatelessWidget {
  const CustomerClipRRect({
    Key? key,
    required this.image,
    this.borderRadius = double8,
  }) : super(key: key);

  final String image;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
