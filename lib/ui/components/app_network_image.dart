import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'app_shimmer.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? size;
  final bool isCircle;
  final BoxFit fit;

  const AppNetworkImage.rectangle({
    super.key,
    required this.imageUrl,
    this.size,
    this.fit = BoxFit.cover,
  }) : isCircle = false;

  const AppNetworkImage.circle({
    super.key,
    required this.imageUrl,
    this.size,
    this.fit = BoxFit.cover,
  }) : isCircle = true;

  @override
  Widget build(BuildContext context) {
    final finalSize = size ?? 50.0;
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: finalSize,
      height: finalSize,
      imageBuilder: (_, imageProvider) => Container(
        width: finalSize,
        height: finalSize,
        decoration: BoxDecoration(
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isCircle ? null : BorderRadius.circular(8),
          image: DecorationImage(image: imageProvider, fit: fit),
        ),
      ),

      placeholder: (_, _) {
        if (isCircle) {
          return AppShimmer.circle(size: finalSize);
        } else {
          return AppShimmer.rectangle(width: finalSize, height: finalSize);
        }
      },
      errorWidget: (_, _, _) => Container(
        width: finalSize,
        height: finalSize,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isCircle ? null : BorderRadius.circular(8),
        ),
        child: Icon(
          Icons.broken_image_outlined,
          color: Colors.grey.shade400,
          size: finalSize * 0.4,
        ),
      ),
    );
  }
}
