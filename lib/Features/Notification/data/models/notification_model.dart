class NotificationModel {
  String? id;
  String? title;
  String? titleEn;
  String? details;
  String? detailsEn;
  String? status;
  String? serviceProviderId;
  String? image;
  String? expirationDate;
  String? createdAt;
  String? updatedAt;

  NotificationModel({
    this.id,
    this.title,
    this.titleEn,
    this.details,
    this.detailsEn,
    this.status,
    this.serviceProviderId,
    this.image,
    this.expirationDate,
    this.createdAt,
    this.updatedAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json['id'] as String?,
        title: json['title'] as String?,
        titleEn: json['title_en'] as String?,
        details: json['details'] as String?,
        detailsEn: json['details_en'] as String?,
        status: json['status'] as String?,
        serviceProviderId: json['service_provider_id'] as String?,
        image: json['image'] as String?,
        expirationDate: json['expiration_date'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'title_en': titleEn,
        'details': details,
        'details_en': detailsEn,
        'status': status,
        'service_provider_id': serviceProviderId,
        'image': image,
        'expiration_date': expirationDate,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
