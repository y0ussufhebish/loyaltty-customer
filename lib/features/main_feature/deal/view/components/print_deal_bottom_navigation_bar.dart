import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/base_button.dart';
import '../../../../widgets/bottom_container.dart';
import '../../controller/deal_cubit.dart';

class PrintDealBottomNavigationBar extends StatelessWidget {
  const PrintDealBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealCubit, DealState>(
      builder: (context, state) {
        if (state.deal == null || state.loading) return const SizedBox.shrink();
        return const BottomContainer(
          child: BaseButton(
            buttonText: 'Redeem',
          ),
        );
      },
    );
  }
}
