import 'package:flutter/material.dart';

import '../../core/helpers/sizer.dart';
import '../../generated/assets.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    this.center = false,
    Key? key}) : super(key: key);

  final bool center;

  @override
  Widget build(BuildContext context) {
    if(center){
      return Center(
        child: Image.asset(
          Assets.logo,
          width: SizerHelper.w(40.0),
          fit: BoxFit.contain,
        ),
      );
    }
    return Image.asset(
      Assets.logo,
      width: SizerHelper.w(40.0),
      fit: BoxFit.contain,
    );
  }
}
