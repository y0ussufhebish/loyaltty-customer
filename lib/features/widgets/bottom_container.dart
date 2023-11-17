import 'package:flutter/material.dart';

import '../../core/helpers/animations/animation_class.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/ui_scales.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    required this.child,
    this.padding = UIScales.paddingValue,
    this.backgroundColor = AppColors.lightColor,
    super.key});

  final double padding;
  final Color backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MyAnimation(
      animationDirection: AnimationDirection.bottom,
      child: Container(
        padding: EdgeInsets.all(padding),
        height: 100,
        color: backgroundColor,
        child: child,
      ),
    );
  }
}
