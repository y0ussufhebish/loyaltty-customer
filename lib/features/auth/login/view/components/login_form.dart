import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyaltty_customer/features/auth/login/controller/tell_me_cubit.dart';
import 'package:loyaltty_customer/features/auth/login/view/components/confirm_field.dart';
import 'package:loyaltty_customer/features/widgets/padding_column.dart';

import '../../../../../core/configs/app_data.dart';
import '../../../../../core/helpers/validators.dart';
import '../../../../widgets/country_code_widget.dart';
import '../../../../widgets/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TellMeCubit, TellMeState>(
      builder: (context, state) {
        var cubit = TellMeCubit.of(context);
        return Form(
          key: cubit.formKey,
          child: PaddingColumn(
            children: [
              CustomTextFormFiled(
                controller: cubit.phoneController,
                textInputType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                hint: 'Phone number',
                label: 'What’s your phone number?',
                validator: Validators.phoneValidator,
                padding: 0,
                prefixIcon: CountryCodeWidget(
                  initialCountryCode: AppData.countryCode,
                  onChanged: cubit.changeCountryCode,
                ),
              ),
              AnimatedCrossFade(
                firstChild: const ConfirmField(),
                secondChild: const SizedBox.shrink(),
                crossFadeState: state.needVerify
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 300),
              ),
              CustomTextFormFiled(
                controller: cubit.nameController,
                textInputAction: TextInputAction.done,
                hint: 'Enter name',
                label: 'What\'s your name?',
                optional: true,
              ),
            ],
          ),
        );
      },
    );
  }
}
