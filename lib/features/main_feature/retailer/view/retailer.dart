import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyaltty_customer/core/data/repo/deal_redemption_repo.dart';
import 'package:loyaltty_customer/core/themes/colors.dart';
import 'package:loyaltty_customer/features/main_feature/retailer/controller/retailer_cubit.dart';

import '../data/repo/retailer_repo.dart';
import 'components/retailer_body.dart';
import 'components/retailer_bottom_bar.dart';

class RetailerScreen extends StatelessWidget {
  const RetailerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RetailerCubit>(
      create: (context) => RetailerCubit(
        dealRepo: DealRedemptionRepo.instance,
        retailerRepo: RetailerRepo.instance,
        businessId: '1',
      )..getRetailer(),
      child: const Scaffold(
        backgroundColor: AppColors.lightColor,
        body: RetailerBody(),
        bottomNavigationBar: RetailerBottomBar(),
      ),
    );
  }
}
