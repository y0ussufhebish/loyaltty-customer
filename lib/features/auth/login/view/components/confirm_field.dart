import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyaltty_customer/core/themes/ui_scales.dart';
import 'package:loyaltty_customer/features/auth/login/controller/tell_me_cubit.dart';
import 'package:loyaltty_customer/features/widgets/base_button.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import '../../../../../core/themes/colors.dart';

class ConfirmField extends StatelessWidget {
  const ConfirmField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TellMeCubit, TellMeState>(
      builder: (context, state) {
        var cubit = TellMeCubit.of(context);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: UIScales.paddingValue),
          child: Row(
            children: [
              PinCodeTextField(
                controller: cubit.codeController,
                maxLength: 4,
                pinBoxBorderWidth: 1.0,
                pinBoxWidth: 55,
                pinBoxHeight: 55,
                pinBoxColor: Colors.white,
                pinBoxDecoration:
                ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                hasUnderline: false,
                pinTextStyle: const TextStyle(
                  color: AppColors.baseColor,
                  fontSize: 20.0,
                ),
                highlightColor: AppColors.baseColor,
                highlight: true,
                highlightPinBoxColor: Colors.white,
                defaultBorderColor: AppColors.lightGrey,
                hasTextBorderColor: AppColors.baseColor,
                errorBorderColor: AppColors.red,
                pinBoxRadius: 18.0,
                autofocus: false,
                hasError: state.pinCodeCompleted,
                onDone: (value) {
                  cubit.pinStatus(false);
                },
              ),
              const SizedBox(width: 8,),
              Expanded(
                child: AnimatedCrossFade(
                  firstChild: Expanded(
                    child: BaseButton(
                      buttonText: 'Confirm',
                      loading: state.verifyLoading,
                      onTap: cubit.verify,
                    ),
                  ),
                  secondChild: const Center(
                    child: Icon(
                      Icons.check_circle,
                      color: AppColors.green,
                      size: 30,
                    ),
                  ),
                  crossFadeState: state.verified
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
