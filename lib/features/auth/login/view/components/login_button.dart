import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyaltty_customer/core/themes/ui_scales.dart';
import 'package:loyaltty_customer/features/auth/login/controller/tell_me_cubit.dart';
import 'package:loyaltty_customer/features/widgets/base_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TellMeCubit, TellMeState>(
      builder: (context, state) {
        var cubit = TellMeCubit.of(context);
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: UIScales.paddingValue,
          ),
          child: BaseButton(
            buttonText: 'Next',
            onTap: cubit.login,
            loading: state.loginLoading,
          ),
        );
      },
    );
  }
}
