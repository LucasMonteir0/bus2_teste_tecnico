import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  final double? width;
  final double? height;
  final double? _size;
  final bool isCircle;

  const AppShimmer.rectangle({this.width, this.height, super.key})
    : _size = null,
      isCircle = false;

  const AppShimmer.circle({double? size, super.key})
    : width = size,
      height = size,
      _size = size,
      isCircle = true;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: SizedBox(
        height: _size ?? height ?? double.infinity,
        width: _size ?? width ?? double.infinity,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.5),
            borderRadius: isCircle
                ? BorderRadius.circular(_size! / 2)
                : BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
