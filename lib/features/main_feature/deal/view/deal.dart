import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enum/deal_status.dart';
import '../../../../core/themes/colors.dart';
import '../controller/deal_cubit.dart';
import '../data/repo/deal_repo.dart';
import 'components/deal_body.dart';
import 'components/print_deal_bottom_navigation_bar.dart';

class DealScreen extends StatelessWidget {
  const DealScreen({
    required this.dealId,
    required this.dealStatus,
    super.key,
  });

  final String dealId;
  final DealStatus dealStatus;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DealCubit>(
      create: (context) => DealCubit(
        dealId: dealId,
        dealStatus: dealStatus,
        dealRepo: DealRepo(),
      ),
      child: const Scaffold(
          backgroundColor: AppColors.lightColor,
          body: DealBody(),
          bottomNavigationBar: PrintDealBottomNavigationBar()
      ),
    );
  }
}
