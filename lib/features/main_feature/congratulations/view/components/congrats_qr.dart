import 'package:flutter/material.dart';
import 'package:loyaltty_customer/features/widgets/custom_text.dart';
import 'package:loyaltty_customer/features/widgets/padding_column.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CongratsQRWidget extends StatelessWidget {
  const CongratsQRWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddingColumn(
      padding: 0,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText.bold('Congratulations!', fontSize: 24),
        const SizedBox(
          height: 8,
        ),
        CustomText.regular(
          'you just saved \$(total deal value) using Loyaltty',
          fontSize: 20,
          maxLines: 5,
          height: 1.3,
          color: const Color(0xff41495A),
        ),
        const SizedBox(
          height: 8,
        ),
        QrImageView(
          data: 'sadassa',
          backgroundColor: Colors.white,
          size: 200,
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
