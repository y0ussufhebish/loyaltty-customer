import '../helpers/cache_helper.dart';
import '../helpers/dio_helper.dart';
import 'app_data.dart';

class UserData {
  static String deviceToken = 'DEVICE TOKEN HERE !!';
  static String userId = CacheHelper.getData(key: 'userId') ?? '';
  static String token = CacheHelper.getData(key: 'token') ?? '';
  static String? accessToken;
  static String? verificationId;

  static saveToken(
    String token, {
    bool saveIndex = true,
  }) {
    CacheHelper.saveData(key: 'token', value: token);
    UserData.token = token;
    if(saveIndex) AppData.saveIndex(2);
    DioHelper().updateHeaders();
  }

  static removeToken(){
    CacheHelper.removeData('token');
    token = '';
    AppData.saveIndex(1);
    DioHelper().removeHeaders();
  }

  static saveUserId(String userId){
    CacheHelper.saveData(key: 'userId', value: userId);
    UserData.userId = userId;
  }

  static removeUserId(){
    CacheHelper.removeData('userId');
    UserData.userId = '';
  }
}
