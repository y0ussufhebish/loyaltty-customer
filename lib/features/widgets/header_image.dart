import 'package:flutter/material.dart';

import '../../core/helpers/navigator_helper.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/ui_scales.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({required this.image, this.hasBack = false, super.key});

  final String image;
  final bool hasBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topStart,
      width: double.infinity,
      height: UIScales.headerImageHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: !hasBack
          ? null
          : SafeArea(
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
            ),
    );
  }
}
