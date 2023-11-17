import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyaltty_customer/core/configs/user_data.dart';
import 'package:loyaltty_customer/core/helpers/navigator_helper.dart';
import 'package:loyaltty_customer/core/themes/colors.dart';
import 'package:loyaltty_customer/features/auth/login/data/repo/auth_repo.dart';
import 'package:loyaltty_customer/features/widgets/custom_snack_bar.dart';

import '../../../../core/configs/app_data.dart';

part 'tell_me_state.dart';

class TellMeCubit extends Cubit<TellMeState> {
  TellMeCubit(this._authRepo) : super(TellMeState(
    countryCode: AppData.dialCode,
  ));

  final AuthRepo _authRepo;
  static TellMeCubit of(BuildContext context) =>
      BlocProvider.of<TellMeCubit>(context);
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> verifyKey = GlobalKey<FormState>();

  changeCountryCode(CountryCode code) {
    AppData.saveCountryCode(code.code!);
    emit(
      state.copyWith(
        countryCode: code.dialCode!,
      ),
    );
  }

  pinStatus(bool isComplete) =>
    emit(state.copyWith(
      pinCodeCompleted: isComplete,
    ));

  Future<void> login() async {
    if(!formKey.currentState!.validate()) return;
    emit(state.copyWith(
      loginLoading: true,
    ));
    var data = {
      'identity': state.countryCode + phoneController.text,
      if(nameController.text.isNotEmpty) 'name': nameController.text,
    };
    try{
      var response = await _authRepo.login(data);
      if (response.statusCode == 200) {
        final token = response.data['data']['token']['access_token'];
        UserData.saveToken(token);
      } else if(response.statusCode == 201){
        emit(state.copyWith(
          needVerify: true,
          verified: false,
          loginLoading: false,
        ));
        return;
      }
      Navigator.pushReplacementNamed(
        NavigatorHelper.context,
        '/retailer',
      );
      emit(
        state.copyWith(
          loginLoading: false,
        ),
      );
    } on DioException catch(e) {
      if(e.response?.statusCode == 403){
        emit(state.copyWith(
          needVerify: true,
          verified: false,
          loginLoading: false,
        ));
        return;
      }
      emit(state.copyWith(
        loginLoading: false,
      ));
      if(e.response?.statusCode == 400){
        showSnackBar(
          e.response!.data['errorMessages'].join(', ') ?? 'Something went wrong',
          snackBarColor: AppColors.red,
        );
      }
    }
  }

  Future<void> verify() async {
    if (!formKey.currentState!.validate()) return;
    emit(state.copyWith(
      verifyLoading: true,
    ));
    var data = {
      'phone_number': state.countryCode + phoneController.text,
      'otp_code': codeController.text,
    };
    try {
      await _authRepo.verify(data);
      emit(
        state.copyWith(
          verifyLoading: false,
          verified: true,
        ),
      );
    } on DioException catch (e) {
      showSnackBar(
        e.response!.data['errorMessages'].join(', ') ?? 'Something went wrong',
        snackBarColor: AppColors.red,
      );
      emit(state.copyWith(
        verifyLoading: false,
      ));
    }
  }

  @override
  Future<void> close() {
    phoneController.dispose();
    codeController.dispose();
    nameController.dispose();
    return super.close();
  }
}
