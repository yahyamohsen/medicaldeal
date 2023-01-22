class UserServiceModel {
  String? id;
  String? orderId;
  String? serviceProviderId;
  String? userId;
  String? total;
  String? status;
  String? updatedAt;
  DateTime? createdAt;
  String? title;

  UserServiceModel({
    this.id,
    this.orderId,
    this.serviceProviderId,
    this.userId,
    this.total,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.title,
  });

  factory UserServiceModel.fromJson(Map<String, dynamic> json) {
    return UserServiceModel(
      id: json['id'] as String?,
      orderId: json['order_id'] as String?,
      serviceProviderId: json['service_provider_id'] as String?,
      userId: json['user_id'] as String?,
      total: json['total'] as String?,
      status: json['status'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdAt: DateTime.parse((json['created_at'] as String?)!),
      title: json['title'] as String?,
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
        'title': title,
      };
}
