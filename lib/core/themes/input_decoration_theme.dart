import 'package:flutter/material.dart';

import '../themes/colors.dart';
import 'ui_scales.dart';

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: Colors.white,
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(UIScales.formRadius),
    borderSide: const BorderSide(
      color: AppColors.lightGrey,
      width: 1.0,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(UIScales.formRadius),
    borderSide: const BorderSide(
      color: AppColors.lightGrey,
      width: 1.0,
    ),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(UIScales.formRadius),
    borderSide: const BorderSide(
      color: AppColors.lightGrey,
      width: 1.0,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(UIScales.formRadius),
    borderSide: const BorderSide(
      color: AppColors.red,
      width: 1.0,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(UIScales.formRadius),
    borderSide: const BorderSide(
      color: AppColors.red,
      width: 1.0,
    ),
  ),
);
