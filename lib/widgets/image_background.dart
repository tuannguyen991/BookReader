import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class ImageBackground extends StatelessWidget {
  const ImageBackground({
    Key? key,
    required this.context,
    required this.imageLink,
  }) : super(key: key);

  final BuildContext context;
  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: CachedNetworkImage(
        imageUrl: imageLink,
        fit: BoxFit.cover,
        color: const Color.fromRGBO(255, 255, 255, 0.1),
        colorBlendMode: BlendMode.modulate,
      ),
    );
  }
}
