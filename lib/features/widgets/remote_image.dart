import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import 'loader.dart';

class RemoteImage extends StatelessWidget {
  const RemoteImage({required this.image, this.fit = BoxFit.cover, Key? key})
      : super(key: key);

  final String image;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: fit,
      loadingBuilder: (context, child, i) {
        if (i == null) {
          return child;
        }
        return const Loader();
      },
      errorBuilder: (context, o, s) => Image.asset(
        Assets.logo,
        fit: BoxFit.contain,
      ),
    );
  }
}
