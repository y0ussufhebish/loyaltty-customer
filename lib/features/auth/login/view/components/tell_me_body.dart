import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';
import '../../../../widgets/header_image.dart';
import '../../../../widgets/padding_column.dart';
import 'confirm_field.dart';
import 'login_button.dart';
import 'login_form.dart';

class TellMeBody extends StatelessWidget {
  const TellMeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const PaddingColumn(
      padding: 0.0,
      center: false,
      children: [
        HeaderImage(
          image: Assets.tellMe,
        ),
        LoginForm(),
        LoginButton(),
        SizedBox(height: 40,)
      ],
    );
  }
}
