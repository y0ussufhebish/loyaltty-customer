import 'package:flutter/material.dart';
import 'package:loyaltty_customer/features/widgets/padding_column.dart';

import 'congrats_qr.dart';
import 'nearby_shops_widget.dart';

class CongratsBody extends StatelessWidget {
  const CongratsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const PaddingColumn(
      children: [
        CongratsQRWidget(),
        NearbyShopsWidget(),
      ],
    );
  }
}
