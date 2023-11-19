import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyaltty_customer/core/themes/ui_scales.dart';
import 'package:loyaltty_customer/features/main_feature/components/deal_widget.dart';
import 'package:loyaltty_customer/features/main_feature/retailer/controller/retailer_cubit.dart';
import 'package:loyaltty_customer/features/widgets/custom_text.dart';

class DealsList extends StatelessWidget {
  const DealsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RetailerCubit, RetailerState>(
      builder: (context, state) {

        List deals = state.business?.deals ?? [];

        if(state.business == null) return const SizedBox.shrink();

        if (state.business!.deals.isEmpty) {
          return Center(
            child: CustomText.bold(
              'No deals available',
              fontSize: 20,
            ),
          );
        }

        return Column(
          children: [
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
              itemBuilder: (context, index) =>
                  DealWidget(
                    index: index,
                    deal: deals[index],
                  ),
              separatorBuilder: (_, __) =>
              const SizedBox(
                height: 8,
              ),
              itemCount: deals.length,
            ),
          ],
        );
      },
    );
  }
}
