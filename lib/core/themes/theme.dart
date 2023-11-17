import 'package:flutter/material.dart';

import '../configs/app_data.dart';
import '../themes/colors.dart';
import 'app_bar_theme.dart';
import 'input_decoration_theme.dart';
import 'text_selecetion_theme.dart';

ThemeData themeData = ThemeData(
    useMaterial3: true,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: AppColors.baseColor,
    primarySwatch: AppColors.primarySwatch,
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
    ),
    fontFamily: AppData.fontFamily,
    textSelectionTheme: textSelectionThemeData,
    inputDecorationTheme: inputDecorationTheme,
    appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(
      color: AppColors.baseColor,
    ),
    typography: Typography());
