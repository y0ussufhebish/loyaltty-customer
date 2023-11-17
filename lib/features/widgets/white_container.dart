import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';
import '../../core/themes/ui_scales.dart';

class WhiteContainer extends StatelessWidget {
  const WhiteContainer({
    required this.child,
    this.verticalPadding = UIScales.paddingValue,
    this.horizontalPadding = UIScales.paddingValue,
    this.topMargin = UIScales.topMarginValue,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final double verticalPadding;
  final double horizontalPadding;
  final double topMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      margin: EdgeInsets.only(
        top: topMargin,
      ),
      color: AppColors.white,
      child: child,
    );
  }
}
