import 'package:flutter/material.dart';
import '../../core/configs/app_data.dart';
import '../../core/themes/colors.dart';
import '../../core/helpers/navigator_helper.dart';

void showSnackBar(
  String message, {
  Color snackBarColor = AppColors.darkGreen,
  Color textColor = AppColors.white,
  SnackBarAction? action,
}) {
  ScaffoldMessenger.of(NavigatorHelper.context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: MediaQuery.of(NavigatorHelper.context).size.width > 600
          ? null
          : const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: snackBarColor,
      width:
          MediaQuery.of(NavigatorHelper.context).size.width > 600 ? 500 : null,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12.0,
          color: textColor,
          fontFamily: AppData.fontFamily,
        ),
      ),
      action: action,
    ),
  );
}
