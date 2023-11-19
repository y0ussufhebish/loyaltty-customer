class Business {
  final String id;
  final String name;
  final String address;
  final String? phoneNumber;
  final String userId;
  final int phoneCountryCode;
  final String category;
  final String description;
  final int postalCode;
  final String websiteUrl;
  final String country;
  final String phoneCountryName;
  final int amount;
  final int pointAmount;
  final Pictures pictures;
  final List<Deal> deals;
  final RewardProgram? rewardProgram;

  Business({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.userId,
    required this.phoneCountryCode,
    required this.category,
    required this.description,
    required this.postalCode,
    required this.websiteUrl,
    required this.country,
    required this.phoneCountryName,
    required this.amount,
    required this.pointAmount,
    required this.pictures,
    required this.deals,
    this.rewardProgram,
  });

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phoneNumber: json['phone_number'],
      userId: json['user_id'],
      phoneCountryCode: json['phone_country_code'],
      category: json['category'],
      description: json['description'],
      postalCode: json['postal_code'],
      websiteUrl: json['website_url'],
      country: json['country'],
      phoneCountryName: json['phone_country_name'],
      amount: json['amount'],
      pointAmount: json['point_amount'],
      pictures: Pictures.fromJson(json['pictures']),
      deals: (json['deals'] as List<dynamic>).map((e) => Deal.fromJson(e)).toList(),
      rewardProgram: RewardProgram.fromJson(json['reward_program']),
    );
  }
}

class Pictures {
  final int count;
  final List<PictureFiles> files;

  Pictures({
    required this.count,
    required this.files,
  });

  factory Pictures.fromJson(Map<String, dynamic> json) {
    return Pictures(
      count: json['count'],
      files: (json['files'] as List<dynamic>).map((e) => PictureFiles.fromJson(e)).toList(),
    );
  }
}

class PictureFiles {
  final String id;
  final String businessId;
  final String pictureType;
  final String createdAt;
  final String pictureUrl;

  PictureFiles({
    required this.id,
    required this.businessId,
    required this.pictureType,
    required this.createdAt,
    required this.pictureUrl,
  });

  factory PictureFiles.fromJson(Map<String, dynamic> json) {
    return PictureFiles(
      id: json['id'],
      businessId: json['business_id'],
      pictureType: json['picture_type'],
      createdAt: json['created_at'],
      pictureUrl: json['picture_url'],
    );
  }
}

class Deal {
  final String id;
  final String name;
  final int? numOfVisits;
  final String type;
  final dynamic price;
  final String currency;
  final String description;
  final String fullDetails;
  final String? startDate;
  final String? endDate;
  final String repeat;
  final String? repeatType;
  final String termsAndConditions;
  final String businessId;
  final String dealPictureUrl;

  Deal({
    required this.id,
    required this.name,
    this.numOfVisits,
    required this.type,
    required this.price,
    required this.currency,
    required this.description,
    required this.fullDetails,
    this.startDate,
    this.endDate,
    required this.repeat,
    this.repeatType,
    required this.termsAndConditions,
    required this.businessId,
    this.dealPictureUrl = '',
  });

  factory Deal.fromJson(Map<String, dynamic> json) {
    return Deal(
      id: json['id'] as String,
      name: json['name'] as String,
      numOfVisits: json['num_of_visits'] as int?,
      type: json['type'] as String,
      price: json['price'],
      currency: json['currency'] as String,
      description: json['description'] as String,
      fullDetails: json['full_details'] as String,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      repeat: json['repeat'] as String,
      repeatType: json['repeat_type'] as String?,
      termsAndConditions: json['terms_and_conditions'] as String,
      businessId: json['business_id'] as String,
      dealPictureUrl: json['deal_picture_url'] ?? '',
    );
  }

  List<String> repeatDays() {
    if (repeatType == 'all') {
      return [
        'Sun',
        'Mon',
        'Tue',
        'Wed',
        'Thu',
        'Fri',
        'Sat',
      ];
    }
    return repeat
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll('"', '')
        .split(',');
  }

  String startDateFormatted() {
    if (startDate == null) {
      return '';
    }
    return startDate!.split('T')[0];
  }

  String endDateFormatted() {
    if (endDate == null) {
      return '';
    }
    return endDate!.split('T')[0];
  }
}

class RewardProgram {
  final String? id;
  final String? name;
  final String? value;
  final String? currency;
  final String? totalStamps;
  final String? daysNumber;
  final String? expiredAt;
  final String? description;
  final String? termsAndConditions;

  RewardProgram({
    this.id,
    this.name,
    this.value,
    this.currency,
    this.totalStamps,
    this.daysNumber,
    this.expiredAt,
    this.description,
    this.termsAndConditions,
  });

  factory RewardProgram.fromJson(Map<String, dynamic> json) {

    if (json.isEmpty) {
      return RewardProgram();
    }

    return RewardProgram(
      id: json['id'],
      name: json['name'],
      value: json['value'],
      currency: json['currency'],
      totalStamps: json['total_stamps'],
      daysNumber: json['days_number'],
      expiredAt: json['expired_at'],
      description: json['description'],
      termsAndConditions: json['terms_and_conditions'],
    );
  }
}
