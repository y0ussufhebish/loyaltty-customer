import 'package:dio/dio.dart';

import '../../features/widgets/custom_snack_bar.dart';
import '../helpers/base_state.dart';
import '../helpers/my_print.dart';
import '../themes/colors.dart';

class RequestsHandling {
  static Future postRequestBase({
    required Function() onTap,
    required Function(BaseState<dynamic>) errorEmit,
    Function(DioException)? errorDio,
    Function(Exception)? errorException,
    bool showError = true,
  }) async {
    try {
      await onTap();
    } on DioException catch (e) {
      errorEmit(ErrorState(msg: '$e'));
      if (!showError) return;
      String? errorMessage;
      if (e.response?.data['errorMessages'] != null) {
        errorMessage = e.response?.data['errorMessages'].join(', ');
      } else if (e.response?.data['message'] != null) {
        errorMessage = e.response?.data['message'];
      }
      if (errorMessage != null && e.response?.data['next_action'] != 'restore') {
        showSnackBar(
          errorMessage,
          snackBarColor: AppColors.red,
        );
      }
      if(errorDio != null) errorDio(e);
    } on Exception catch (e) {
      errorEmit(ErrorState(msg: '$e'));
      MyPrint.errorPrint('Error: $e');
      if (!showError) return;
      showSnackBar(
        'Something went wrong',
        snackBarColor: AppColors.red,
      );
      if(errorException != null) errorException(e);
    }
  }

  static Future postRequest({
    required Function() onTap,
    required Function() errorEmit,
    bool showError = true,
  }) async {
    try {
      await onTap();
    } on DioException catch (e) {
      errorEmit();
      if (!showError) return;
      String? errorMessage;
      if (e.response?.data['errorMessages'] != null) {
        errorMessage = e.response?.data['errorMessages'].join(', ');
      } else if (e.response?.data['message'] != null) {
        errorMessage = e.response?.data['message'];
      }
      if (errorMessage != null) {
        showSnackBar(
          errorMessage,
          snackBarColor: AppColors.red,
        );
      }
    } catch (e, s) {
      errorEmit();
      MyPrint.errorPrint('Error: $e');
      MyPrint.errorPrint('Error: $s');
      if (!showError) return;
      showSnackBar(
        'Something went wrong',
        snackBarColor: AppColors.red,
      );
    }
  }
}