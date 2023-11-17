import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../core/themes/ui_scales.dart';

class PaddingColumn extends StatelessWidget {
  const PaddingColumn({
    required this.children,
    this.padding = UIScales.paddingValue,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.center = true,
    this.paddingType,
    this.scrollable = true,
    Key? key,
  }) : super(key: key);

  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final double padding;
  final EdgeInsetsGeometry? paddingType;
  final bool center;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    if(!scrollable){
      return Container(
        alignment: center ? Alignment.center : Alignment.topCenter,
        child: Padding(
          padding: paddingType ?? EdgeInsets.all(padding),
          child: AnimationLimiter(
            child: Column(
              mainAxisSize: mainAxisSize,
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 600),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: - 50.0,
                  verticalOffset: 10,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: children,
              ),
            ),
          ),
        ),
      );
    }
    return Container(
      alignment: center ? Alignment.center : Alignment.topCenter,
      child: SingleChildScrollView(
        child: Padding(
          padding: paddingType ?? EdgeInsets.all(padding),
          child: AnimationLimiter(
            child: Column(
              mainAxisSize: mainAxisSize,
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 600),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: - 50.0,
                  verticalOffset: 10,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: children,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
