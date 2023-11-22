import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyaltty_customer/core/themes/colors.dart';
import 'package:loyaltty_customer/core/themes/ui_scales.dart';
import 'package:loyaltty_customer/features/main_feature/components/deal_widget.dart';
import 'package:loyaltty_customer/features/main_feature/retailer/controller/retailer_cubit.dart';
import 'package:loyaltty_customer/features/widgets/custom_text.dart';
import 'package:loyaltty_customer/features/widgets/custom_text_button.dart';

class DealsList extends StatelessWidget {
  const DealsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RetailerCubit, RetailerState>(
      builder: (context, state) {

        var cubit = RetailerCubit.of(context);

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
                  AnimatedCrossFade(
                    firstChild: CustomTextButton(
                      buttonText: 'Select',
                      onTap: cubit.enableSelection,
                    ),
                    secondChild: Row(
                      children: [
                        CustomTextButton(
                          buttonText: 'Unselect',
                          onTap: cubit.enableSelection,
                          buttonColor: Colors.red,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomTextButton(
                          buttonText: 'Select All',
                          onTap: cubit.selectAllDeals,
                        ),
                      ],
                    ),
                    crossFadeState: state.enableSelection? CrossFadeState.showSecond : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 300),
                  ),
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
              itemBuilder: (context, index) => Row(
                children: [
                  if (state.enableSelection)
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Checkbox(
                        value: state.selectedDeals
                            .contains(int.parse(state.business!.deals[index].id)),
                        activeColor: AppColors.baseColor,
                        side: const BorderSide(
                          color: AppColors.grey01,
                          width: 1.5,
                        ),
                        onChanged: (value) =>
                            cubit.selectDeal(state.business!.deals[index].id),
                      ),
                    ),
                  Expanded(
                    child: DealWidget(
                      index: index,
                      stopRedeem: state.enableSelection,
                      deal: deals[index],
                    ),
                  ),
                ],
              ),
              separatorBuilder: (_, __) => const SizedBox(
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
