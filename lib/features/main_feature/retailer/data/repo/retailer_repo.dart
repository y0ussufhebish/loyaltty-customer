import 'package:dio/dio.dart';
import 'package:loyaltty_customer/core/data/model/business_model.dart';

import '../../../../../core/configs/endpoints.dart';
import '../../../../../core/helpers/dio_helper.dart';

class RetailerRepo{
  RetailerRepo._();

  static RetailerRepo get instance {
    if(_instance == null) {
      _instance = RetailerRepo._();
      _instance!._dioHelper = DioHelper();
    }
    return _instance!;
  }

  static RetailerRepo? _instance;
  late DioHelper _dioHelper;

  Future<Business> getRetailer(String id) async {
    final Response response =  await _dioHelper.getData(
      url: EndPoints.business(id),
    );
    return Business.fromJson(response.data['data']);
  }

  Future<Business> requestStamp(String id, String rewardId) async {
    final Response response =  await _dioHelper.getData(
      url: EndPoints.requestStamp(id, rewardId),
    );
    return Business.fromJson(response.data['data']);
  }

  Future<Business> redeemReward(String id, String rewardId) async {
    final Response response =  await _dioHelper.getData(
      url: EndPoints.redeemReward(id, rewardId),
    );
    return Business.fromJson(response.data['data']);
  }
}