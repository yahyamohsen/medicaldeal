class PromoCodeModel {
  String? id;
  String? serviceProviderId;
  String? couponCode;
  String? expirationDate;
  String? discount;
  String? discountTypeId;
  String? maxdiscount;
  String? updatedAt;
  String? createdAt;

  PromoCodeModel({
    this.id,
    this.serviceProviderId,
    this.couponCode,
    this.expirationDate,
    this.discount,
    this.discountTypeId,
    this.maxdiscount,
    this.updatedAt,
    this.createdAt,
  });

  factory PromoCodeModel.fromJson(Map<String, dynamic> json) => PromoCodeModel(
        id: json['id'] as String?,
        serviceProviderId: json['service_provider_id'] as String?,
        couponCode: json['CouponCode'] as String?,
        expirationDate: json['expirationDate'] as String?,
        discount: json['discount'] as String?,
        discountTypeId: json['discount_type_id'] as String?,
        maxdiscount: json['Maxdiscount'] as String?,
        updatedAt: json['updated_at'] as String?,
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'service_provider_id': serviceProviderId,
        'CouponCode': couponCode,
        'expirationDate': expirationDate,
        'discount': discount,
        'discount_type_id': discountTypeId,
        'Maxdiscount': maxdiscount,
        'updated_at': updatedAt,
        'created_at': createdAt,
      };
}
