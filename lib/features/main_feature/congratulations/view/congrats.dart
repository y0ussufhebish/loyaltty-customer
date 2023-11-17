import 'package:flutter/material.dart';
import 'package:loyaltty_customer/core/themes/colors.dart';
import 'package:loyaltty_customer/core/themes/ui_scales.dart';
import 'package:loyaltty_customer/features/widgets/custom_app_bar.dart';

import '../../../../generated/assets.dart';
import 'components/congrats_body.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: UIScales.paddingValue,
            vertical: UIScales.paddingValue,
          ),
          alignment: Alignment.topCenter,
          constraints: const BoxConstraints.expand(),
          color: AppColors.lightColor,
          child: SafeArea(
            child: Image.asset(
              Assets.congrats,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(),
          body: CongratsBody(),
        ),
      ],
    );
  }
}
