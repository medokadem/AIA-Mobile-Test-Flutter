import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../config/app_colors.dart';

class ImageWaitingShimmer extends StatelessWidget {
  const ImageWaitingShimmer({super.key, required this.height, this.isCircle = false});

  final double height;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighlightedColor,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: AppColors.white,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        ),
      ),
    );
  }
}
