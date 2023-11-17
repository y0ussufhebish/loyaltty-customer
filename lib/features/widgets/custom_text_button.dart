import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';
import 'loader.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.buttonText,
    this.fontSize = 16.0,
    this.height = 1.0,
    this.buttonColor = AppColors.baseColor,
    this.onTap,
    this.isUnderLine = false,
    this.isDisabled = false,
    this.loading = false,
    Key? key,
  }) : super(key: key);

  final String buttonText;
  final double fontSize;
  final double height;
  final Color buttonColor;
  final Function()? onTap;
  final bool isUnderLine;
  final bool isDisabled;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    if(loading) return const Loader();

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: isDisabled? null : onTap,
      child: Text(
        buttonText,
        textScaleFactor: 1.0,
        style: TextStyle(
          height: height,
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          color: isDisabled? AppColors.grey01 : buttonColor,
          decoration:
              isUnderLine ? TextDecoration.underline : TextDecoration.none,
        ),
      ),
    );
  }
}
