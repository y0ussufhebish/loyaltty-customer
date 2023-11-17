import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../configs/endpoints.dart';
import '../configs/user_data.dart';

class DioHelper {
  DioHelper._();

  factory DioHelper() {
    if (_instance == null) {
      _instance = DioHelper._();
      _instance!.dio = Dio(BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
      ));
    }
    return _instance!;
  }

  Future init() async {
    if (kDebugMode) {
      _instance!.dio.interceptors.add(
        LogInterceptor(
          request: true,
          responseBody: true,
          requestBody: true,
          requestHeader: true,
          responseHeader: false,
        ),
      );
    }
    await updateHeaders();
  }

  static DioHelper? _instance;
  late Dio dio;

  Future<void> updateHeaders() async {
    final token = UserData.token;
    if (token.isEmpty) {
      return;
    }
    dio.options.headers.addAll({'Authorization': 'Bearer $token'});
  }

  void removeHeaders() {
    dio.options.headers.remove('Authorization');
  }


  /// DIO GET REQUESTS METHOD ..
  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  /// DIO POST REQUESTS METHOD ..
  Future<Response> postData({
    required String url,
    required dynamic data,
    Map<String, dynamic>? query,
  }) async {
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  /// DIO Put REQUESTS METHOD ..
  Future<Response> putData({
    required String url,
    required dynamic data,
    Map<String, dynamic>? query,
  }) async {
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  /// DIO DELETE REQUESTS METHOD ..
  Future<Response> delete({
    required String url,
    dynamic data,
    Map<String, dynamic>? query,
  }) async {
    return await dio.delete(
      url,
      queryParameters: query,
      data: data,
    );
  }

  /// DIO PATCH REQUESTS METHOD ..
  Future<Response> patch({
    required String url,
    required dynamic data,
    Map<String, dynamic>? query,
  }) async {
    return await dio.patch(
      url,
      queryParameters: query,
      data: data,
    );
  }

  Future<Response> postFileData({
    required String url,
    required dynamic data,
    Map<String, dynamic>? query,
  }) async {
    FormData formData = FormData.fromMap(data);
    var response = await dio.post(
      url,
      queryParameters: query,
      data: formData,
    );

    return response;
  }
}
