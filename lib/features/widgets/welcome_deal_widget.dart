import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';
import 'custom_text.dart';

class WelcomeDealWidget extends StatelessWidget {
  const WelcomeDealWidget({
    this.backgroundColor = const Color(0xFFDBF7FF),
    super.key});

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 3,
      ),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: CustomText.bold(
        'Welcome Deal',
        fontSize: 13,
        color: AppColors.baseColor,
        height: 1.5,
      ),
    );
  }
}
