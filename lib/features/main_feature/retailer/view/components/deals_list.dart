import 'package:flutter/material.dart';
import 'package:loyaltty_customer/core/themes/ui_scales.dart';
import 'package:loyaltty_customer/features/main_feature/components/deal_widget.dart';
import 'package:loyaltty_customer/features/widgets/custom_text.dart';

class DealsList extends StatelessWidget {
  const DealsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: UIScales.paddingValue,
        ).copyWith(
          bottom: UIScales.paddingValue,
        ),
        child: Row(
          children: [
            CustomText.bold(
              'Deals',
              fontSize: 25,
            ),
            const Spacer(),
          ],
        ),
      ),
      ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: UIScales.paddingValue,
        ).copyWith(
          bottom: UIScales.paddingValue,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => DealWidget(
          index: index,
        ),
        separatorBuilder: (_, __) => const SizedBox(
          height: 8,
        ),
        itemCount: 20,
      ),
    ]);
  }
}
