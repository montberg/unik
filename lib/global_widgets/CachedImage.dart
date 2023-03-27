
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {


  const CachedImage({
    Key? key,
    required this.image, required this.height,
  }) : super(key: key);

  final String image;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      fit: BoxFit.fitHeight,
      imageUrl: image,
      placeholder: (context, url) => SizedBox(
        child: Center(child: CircularProgressIndicator()),
        height: height,
      ),
      errorWidget: (context, url, error) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error,
              color: Colors.black.withOpacity(0.5)),
          Text(
            "Не удалось загрузить изображение :(",
            style: TextStyle(
                color: Colors.black.withOpacity(0.5)),
          )
        ],
      ),
    );
  }
}
