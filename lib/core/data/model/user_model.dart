class UserModel {
  String id;
  String phoneNumber;
  int phoneCountryCode;
  String name;
  String email;
  String userType;
  bool hasBusiness;
  bool verified;
  bool hasWelcomeDeal;
  Business? business;

  UserModel({
    required this.id,
    required this.phoneNumber,
    required this.phoneCountryCode,
    required this.verified,
    required this.name,
    required this.email,
    required this.userType,
    required this.hasBusiness,
    required this.hasWelcomeDeal,
    this.business,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      phoneNumber: json['phone_number'] as String,
      phoneCountryCode: json['phone_country_code'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      userType: json['user_type'] as String,
      hasBusiness: json['has_business'] as bool,
      verified: json['is_verified'] as bool,
      hasWelcomeDeal: json['has_welcome_deal'] as bool,
      business: json['business'] == null
          ? null
          : Business.fromJson(json['business'] as Map<String, dynamic>),
    );
  }
}

class Business {
  String id;
  String name;
  String address;
  int postalCode;
  String phoneNumber;
  int phoneCountryCode;
  String category;
  String userId;
  String websiteUrl;
  String description;
  String country;
  dynamic amount;
  int pointAmount;

  Business({
    required this.id,
    required this.name,
    required this.address,
    required this.postalCode,
    required this.phoneNumber,
    required this.phoneCountryCode,
    required this.category,
    required this.userId,
    required this.websiteUrl,
    required this.description,
    required this.country,
    required this.amount,
    required this.pointAmount,
  });

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      postalCode: json['postal_code'] as int,
      phoneNumber: json['phone_number'] ?? '',
      phoneCountryCode: json['phone_country_code'] as int,
      category: json['category'] as String,
      userId: json['user_id'] as String,
      websiteUrl: json['website_url'] as String,
      description: json['description'] as String,
      country: json['country'] as String,
      amount: json['amount'],
      pointAmount: json['point_amount'] as int,
    );
  }
}
