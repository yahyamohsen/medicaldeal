import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

class ServiceModel extends Equatable {
  String? id;
  String? title;
  String? titleEn;
  String? typeId;
  String? status;
  String? updatedAt;
  String? createdAt;
  double? price;
  double? userDiscount;

  ServiceModel({
    this.id,
    this.title,
    this.titleEn,
    this.typeId,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.price,
    this.userDiscount,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        id: json['id'] as String?,
        title: json['title'] as String?,
        titleEn: json['title_en'] as String?,
        typeId: json['type_id'] as String?,
        status: json['status'] as String?,
        updatedAt: json['updated_at'] as String?,
        createdAt: json['created_at'] as String?,
        price: double.parse(json['price'] as String? ?? '0'),
        userDiscount: double.parse(json['userdiscount'] as String? ?? '0'),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'title_en': titleEn,
        'type_id': typeId,
        'status': status,
        'updated_at': updatedAt,
        'created_at': createdAt,
      };

  @override
  List<Object?> get props => [id, price, userDiscount];
}
