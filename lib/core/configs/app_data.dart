import 'package:country/country.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/material.dart';
import 'package:loyaltty_customer/features/widgets/custom_drop_down.dart';

import '../helpers/cache_helper.dart';
import '../helpers/sizer.dart';

class AppData {
  static const String label = 'Loyaltty Customer';
  static const String fontFamily = 'Poppins';
  static String lang = CacheHelper.getData(key: 'lang') ?? 'en';
  static double bottomSpace = SizerHelper.w(28.0);
  static int startIndex = CacheHelper.getData(key: 'start_index') ?? 0;
  static List<Widget> screens = const [];

  static saveIndex(int index) {
    CacheHelper.saveData(key: 'start_index', value: index);
    startIndex = index;
  }

  static String countryCode = CacheHelper.getData(key: 'country_code') ?? 'US';
  static String dialCode = CacheHelper.getData(key: 'dial_code') ?? '+1';


  static Future<void> getDefaultLang() async {
    if(CacheHelper.getData(key: 'country_code') != null) return;
    final locale = await Devicelocale.currentAsLocale;
    if(locale != null){
      final countryCode = locale.countryCode ?? 'US';
      saveCountryCode(countryCode);
    }
  }

  static saveCountryCode(String code) {
    CacheHelper.saveData(key: 'country_code', value: code);
    countryCode = code;
    final country = Countries.values.firstWhere((element) => element.alpha2 == code);
    dialCode = '+${country.countryCode}';
    CacheHelper.saveData(key: 'dial_code', value: dialCode);
  }
}
