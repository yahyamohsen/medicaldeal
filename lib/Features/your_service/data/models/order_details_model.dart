class OrderDetailsModel {
  String? id;
  String? orderId;
  String? serviceProviderId;
  String? userId;
  String? total;
  String? status;
  String? updatedAt;
  String? createdAt;
  String? serviceId;
  String? amount;
  String? cost;
  dynamic title;
  dynamic titleEn;

  OrderDetailsModel({
    this.id,
    this.orderId,
    this.serviceProviderId,
    this.userId,
    this.total,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.serviceId,
    this.amount,
    this.cost,
    this.title,
    this.titleEn,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      id: json['id'] as String?,
      orderId: json['order_id'] as String?,
      serviceProviderId: json['service_provider_id'] as String?,
      userId: json['user_id'] as String?,
      total: json['total'] as String?,
      status: json['status'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      serviceId: json['service_id'] as String?,
      amount: json['amount'] as String?,
      cost: json['cost'] as String?,
      title: json['title'] as dynamic,
      titleEn: json['title_en'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'order_id': orderId,
        'service_provider_id': serviceProviderId,
        'user_id': userId,
        'total': total,
        'status': status,
        'updated_at': updatedAt,
        'created_at': createdAt,
        'service_id': serviceId,
        'amount': amount,
        'cost': cost,
        'title': title,
        'title_en': titleEn,
      };
}
