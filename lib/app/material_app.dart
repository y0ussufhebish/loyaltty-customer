import 'package:flutter/material.dart';
import 'package:loyaltty_customer/core/themes/colors.dart';
import 'package:loyaltty_customer/features/auth/login/view/tell_me.dart';
import 'package:loyaltty_customer/features/main_feature/congratulations/view/congrats.dart';
import 'package:loyaltty_customer/features/main_feature/retailer/view/retailer.dart';

import '../core/configs/app_data.dart';
import '../core/configs/endpoints.dart';
import '../core/helpers/navigator_helper.dart';
import '../core/themes/theme.dart';

MaterialApp materialApp(
  BuildContext context,
) =>
    MaterialApp(
      debugShowCheckedModeBanner: !EndPoints.productionMode,
      navigatorKey: NavigatorHelper.navigateKey,
      title: AppData.label,
      theme: themeData,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const TellMeScreen(),
        '/retailer': (context) => const RetailerScreen(),
        '/congrats': (context) => const CongratsScreen(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/login':
            return MaterialPageRoute(
              builder: (context) => const TellMeScreen(),
            );
          case '/retailer':
            return MaterialPageRoute(
              builder: (context) => const RetailerScreen(),
            );
          case '/congrats':
            return MaterialPageRoute(
              builder: (context) => const CongratsScreen(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => const TellMeScreen(),
            );
        }
      },
      builder: (context, child) {
        double width = MediaQuery.of(context).size.width;
        if (width < 450) return child!;

        return Scaffold(
          backgroundColor: AppColors.lightColor,
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                alignment: Alignment.center,
                width: 450,
                child: child!,
              ),
            ],
          ),
        );
      },
      // home: const CongratsScreen(),
    );
