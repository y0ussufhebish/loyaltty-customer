import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyaltty_customer/features/main_feature/retailer/controller/retailer_cubit.dart';
import 'package:loyaltty_customer/features/widgets/white_container.dart';

import '../../../../widgets/base_button.dart';

class RetailerBottomBar extends StatelessWidget {
  const RetailerBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RetailerCubit, RetailerState>(
      builder: (context, state) {
        var cubit = RetailerCubit.of(context);

        if (!state.enableSelection) return const SizedBox.shrink();

        return WhiteContainer(
          child: BaseButton(
            buttonText: 'Redeem Selected deals',
            onTap: cubit.redeemMultipleDeals,
            loading: state.multipleDealRedeemLoading,
            isDisabled: state.selectedDeals.isEmpty,
          ),
        );
      },
    );
  }
}
