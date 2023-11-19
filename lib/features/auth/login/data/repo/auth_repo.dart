import 'package:dio/dio.dart';
import 'package:loyaltty_customer/core/configs/endpoints.dart';
import 'package:loyaltty_customer/core/helpers/dio_helper.dart';

class AuthRepo{
  AuthRepo._();

  static AuthRepo get instance {
    if(_instance == null) {
      _instance = AuthRepo._();
      _instance!._dioHelper = DioHelper();
    }
    return _instance!;
  }

  static AuthRepo? _instance;
  late DioHelper _dioHelper;

  Future<Response> login(data) async {
    return await _dioHelper.postData(
      url: EndPoints.login,
      data: data,
    );
  }

  Future<Response> verify(data) async {
    return await _dioHelper.postData(
      url: EndPoints.verifyOtp,
      data: data,
    );
  }

  Future<Response> saveDeviceToken(data) async {
    return await _dioHelper.postData(
      url: EndPoints.deviceToken,
      data: data,
    );
  }
}