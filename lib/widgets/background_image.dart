import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: CachedNetworkImage(
        imageUrl: 'https://cdn.pixabay.com/photo/2016/08/24/16/20/books-1617327_960_720.jpg',
        fit: BoxFit.fill,
        color: AppColors.primaryColor.withOpacity(1),
        colorBlendMode: BlendMode.modulate,
      ),
    );
  }
}