import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyaltty_customer/features/auth/login/controller/tell_me_cubit.dart';
import 'package:loyaltty_customer/features/auth/login/data/repo/auth_repo.dart';

import '../../../../core/themes/colors.dart';
import 'components/tell_me_body.dart';

class TellMeScreen extends StatelessWidget {
  const TellMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TellMeCubit>(
      create: (context) => TellMeCubit(AuthRepo.instance),
      child: const Scaffold(
        backgroundColor: AppColors.lightColor,
        body: TellMeBody(),
      ),
    );
  }
}
