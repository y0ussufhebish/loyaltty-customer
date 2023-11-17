import 'package:flutter/material.dart';

class AppColors {
  static const Color baseColor = Color(0xFF040869);
  static const Color lightColor = Color(0xFFB4EDFF);
  static const Color white = Color(0xFFF6F6FB);
  static const Color textBlack = Color(0xFF282828);
  static const Color black = Color(0xFF000000);
  static const Color black01 = Color(0xFF333333);
  static const Color labelGrey = Color(0xFFFFFBEE);
  static const Color scaffoldBackground = Color(0xFFF5F5F5);
  static const Color scaffoldBackground02 = Color(0xFFF7F7F7);

  static const Color lightGrey = Color(0xFFECECEC);
  static const Color grey01 = Color(0xFF969696);
  static const Color grey02 = Color(0xFF686666);
  static const Color grey03 = Color(0xFFF7F7F7);
  static const Color grey04 = Color(0xFF959595);
  static const Color grey05 = Color(0xFF646464);

  static const Color red = Color(0xFFB74343);
  static const Color green = Color(0xFF2DAA54);
  static const Color darkGreen = Color(0xFF4A8200);

  static const MaterialColor primarySwatch = MaterialColor(
    0xFF040869, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    // HINT: SITE : https://maketintsandshades.com is used to get shades of the primary swatch
    <int, Color>{
      50: Color(0xff04075f), //10%
      100: Color(0xff030654), //20%
      200: Color(0xff03064a), //30%
      300: Color(0xff02053f), //40%
      400: Color(0xff020435), //50%
      500: Color(0xff02032a), //60%
      600: Color(0xff01021f), //70%
      700: Color(0xff010215), //80%
      800: Color(0xff00010a), //90%
      900: Color(0xff000000), //100%
    },
  );
}
