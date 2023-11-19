class EndPoints {
  static const String productionUrl = '';
  static const String stagingUrl = 'http://161.35.65.1:8080/';
  static const String baseUrl = productionMode ? productionUrl : stagingUrl;
  static const bool productionMode = false;

  static const String customer = 'customer';
  static const String auth = 'auth/';
  static const String login = '$auth$customer/login';
  static const String verifyOtp = '$auth$customer/verify-otp';
  static const String deviceToken = 'notification';
  /// [dealId] is the id of the deal

  /// - Used for uploading deal pictures
  /// - providing [pictureId] to delete the picture
  static String business(String id) => '$customer/business/$id';
  static String dealPicture(String dealId) => '$customer/deal/$dealId/picture';
  static String requestStamp(String id, String rewardId) => '$customer/business/$id/stamp/$rewardId';
  static String redeemReward(String id, String rewardId) => '$customer/business/$id/reward/$rewardId';
  static String dealRedemption = '$customer/deal/redemption';
  static const String deal = '$customer/deal';

  static String businessPicture = '$customer/business/picture';
}
