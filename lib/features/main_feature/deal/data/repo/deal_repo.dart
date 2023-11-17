import '../../../../../core/configs/endpoints.dart';
import '../../../../../core/data/model/deal_model.dart';
import '../../../../../core/helpers/dio_helper.dart';

class DealRepo{
  DealRepo._();

  factory DealRepo(){
    _instance ??= DealRepo._();
    _instance!._dioHelper = DioHelper();
    return _instance!;
  }

  static DealRepo? _instance;
  late DioHelper _dioHelper;

  Future<Deal> getDeal(String id) async{
    final response = await _dioHelper.getData(url: '${EndPoints.deal}/$id');
    return Deal.fromJson(response.data['data']);
  }
}