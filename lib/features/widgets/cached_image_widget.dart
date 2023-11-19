import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loyaltty_customer/core/themes/colors.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({
    required this.imageUrl,
    this.colorFilter,
    this.borderRadius = 0,
    this.width,
    this.height,
    super.key});

  final String imageUrl;
  final ColorFilter? colorFilter;
  final double borderRadius;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter: colorFilter,
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(
        width: width,
        height: height,
        child: Center(
          child: CircularProgressIndicator(value: downloadProgress.progress),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: AppColors.baseColor.withOpacity(0.2),
        ),
        child: const Center(
          child: Icon(Icons.error),
        ),
      ),
    );
  }
}
