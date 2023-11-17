import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';
import 'custom_text.dart';
import 'loader.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    required this.buttonText,
    this.textColor = AppColors.white,
    this.buttonColor = AppColors.baseColor,
    this.borderColor = AppColors.baseColor,
    this.iconColor = AppColors.baseColor,
    this.fontWeight = FontWeight.bold,
    this.width = double.infinity,
    this.height = 48.0,
    this.borderRadius = 14.0,
    this.fontSize = 16.0,
    this.isOutLine = false,
    this.isDisabled = false,
    this.loading = false,
    this.onTap,
    this.icon,
    this.image,
    Key? key,
  }) : super(key: key);

  final String buttonText;
  final String? image;
  final Color textColor;
  final Color buttonColor;
  final Color borderColor;
  final Color iconColor;
  final FontWeight fontWeight;
  final double width;
  final double height;
  final double borderRadius;
  final double fontSize;
  final bool isOutLine;
  final bool isDisabled;
  final bool loading;
  final Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (isDisabled || loading) ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: isOutLine
              ? null
              : isDisabled
                  ? AppColors.grey01
                  : buttonColor,
          border: isOutLine ? Border.all(color: borderColor, width: 2.0) : null,
          boxShadow: isOutLine? null : [
            BoxShadow(
              color: AppColors.baseColor.withOpacity(0.34),
              blurRadius: 4.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        height: height,
        width: width,
        child: loading
            ? const Loader(
                color: Colors.white,
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    Icon(
                      icon,
                      color: iconColor,
                      size: 24.0,
                    ),
                  if (image != null)
                    Image.asset(
                      image ?? '',
                      width: 20.0,
                      color: iconColor,
                      fit: BoxFit.contain,
                    ),
                  if (icon != null || image != null)
                    const SizedBox(
                      width: 13.0,
                    ),
                  if (width < double.infinity)
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: width -
                            (icon != null || image != null ? 78.0 : 25.0),
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: CustomText.bold(
                          buttonText,
                          fontSize: fontSize,
                          fontWeight: fontWeight,
                          color: textColor,
                          height: 2.0,
                        ),
                      ),
                    ),
                  if (width == double.infinity)
                    CustomText.bold(
                      buttonText,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                      color: textColor,
                      height: 2.0,
                    )
                ],
              ),
      ),
    );
  }
}
