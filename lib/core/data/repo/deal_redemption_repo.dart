import 'package:dio/dio.dart';

import '../../../../../core/configs/endpoints.dart';
import '../../../../../core/helpers/dio_helper.dart';

class DealRedemptionRepo{
  DealRedemptionRepo._();

  static DealRedemptionRepo get instance {
    if(_instance == null) {
      _instance = DealRedemptionRepo._();
      _instance!._dioHelper = DioHelper();
    }
    return _instance!;
  }

  static DealRedemptionRepo? _instance;
  late DioHelper _dioHelper;

  Future<dynamic> redeemSingleDeal(int id) async{
    final Response response = await _dioHelper.postData(
      url: EndPoints.dealRedemption,
      data: {
        'id': id,
      },
    );
    return response.data;
  }

  Future<dynamic> redeemMultipleDeal(List<int> id) async{
    final Response response = await _dioHelper.postData(
      url: EndPoints.dealRedemption,
      data: {
        'id': id,
      },
    );
    return response.data;
  }
}