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
  final String? dealPictureUrl;
  final Pictures? pictures;

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
    this.dealPictureUrl,
    this.pictures,
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
      dealPictureUrl: json['deal_picture_url'] as String?,
      pictures:
          json['pictures'] != null ? Pictures.fromJson(json['pictures']) : null,
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

class Pictures {
  int count;
  List<PictureFile> files;

  Pictures({required this.count, required this.files});

  factory Pictures.fromJson(Map<String, dynamic> json) {
    var filesList = json['files'] as List;
    List<PictureFile> files =
    filesList.map((i) => PictureFile.fromJson(i)).toList();

    return Pictures(count: json['count'], files: files);
  }
}

class PictureFile {
  String id;
  String dealId;
  String pictureUrl;

  PictureFile({
    required this.id,
    required this.dealId,
    required this.pictureUrl,
  });

  factory PictureFile.fromJson(Map<String, dynamic> json) {
    return PictureFile(
      id: json['id'],
      dealId: json['deal_id'],
      pictureUrl: json['picture_url'],
    );
  }
}
