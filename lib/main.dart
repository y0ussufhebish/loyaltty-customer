import 'package:flutter/material.dart';
import 'app/my_app.dart';
import 'core/configs/app_data.dart';
import 'core/helpers/cache_helper.dart';
import 'core/helpers/dio_helper.dart';
import 'core/helpers/my_print.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  MyPrint.debugPrintOverride();
  await DioHelper().init();
  await AppData.getDefaultLang();

  runApp(
    const MyApp(),
  );
}
