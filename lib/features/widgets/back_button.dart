import 'package:flutter/material.dart';

import '../../core/helpers/navigator_helper.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/ui_scales.dart';

class CircularBackButton extends StatelessWidget {
  const CircularBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(UIScales.paddingValue),
        child: IconButton(
          onPressed: () => NavigatorHelper.pop(),
          color: AppColors.white,
          icon: const CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.white,
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.baseColor,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
