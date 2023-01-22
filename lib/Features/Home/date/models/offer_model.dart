class OfferModel {
  String? id;
  String? title;
  String? offerDetails;
  String? serviceProviderId;
  String? image;
  String? discount;
  String? expirationdate;
  String? updatedAt;
  String? createdAt;

  OfferModel({
    this.id,
    this.title,
    this.offerDetails,
    this.serviceProviderId,
    this.image,
    this.discount,
    this.expirationdate,
    this.updatedAt,
    this.createdAt,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
        id: json['id'] as String?,
        title: json['title'] as String?,
        offerDetails: json['offer_details'] as String?,
        serviceProviderId: json['service_provider_id'] as String?,
        image: json['image'] as String?,
        discount: json['discount'] as String?,
        expirationdate: json['expirationdate'] as String?,
        updatedAt: json['updated_at'] as String?,
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'offer_details': offerDetails,
        'service_provider_id': serviceProviderId,
        'image': image,
        'discount': discount,
        'expirationdate': expirationdate,
        'updated_at': updatedAt,
        'created_at': createdAt,
      };
}
