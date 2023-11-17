import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';

class Loader extends StatelessWidget {
  const Loader({this.color = AppColors.baseColor, Key? key}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: color,
      ),
    );
  }
}
