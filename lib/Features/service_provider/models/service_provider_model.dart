import 'package:equatable/equatable.dart';

class ServiceProviderModel extends Equatable {
  final String? id;
  final String? title;
  final String? titleEn;
  final String? description;
  final dynamic descriptionEn;
  final String? categoryId;
  final String? image;
  final String? website;
  final String? status;
  final String? updatedAt;
  final String? servicesId;
  final String? userdiscount;
  final String? price;
  final String? createdAt;
  final String? categoryname;
  final String? facbook;
  final String? instgram;
  final String? phone;
  final String? twitter;
  final String? rating;

  const ServiceProviderModel({
    this.servicesId,
    this.userdiscount,
    this.price,
    this.rating,
    this.id,
    this.title,
    this.titleEn,
    this.description,
    this.descriptionEn,
    this.categoryId,
    this.image,
    this.website,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.categoryname,
    this.facbook,
    this.instgram,
    this.phone,
    this.twitter,
  });

  factory ServiceProviderModel.fromJson(Map<String, dynamic> json) {
    return ServiceProviderModel(
      servicesId: json['services_id'],
      userdiscount: json['userdiscount'],
      price: json['price'],
      rating: json['rate'] ?? '0',
      id: json['id'].toString(),
      title: json['title'] as String?,
      titleEn: json['title_en'] as String?,
      description: json['description'] as String?,
      descriptionEn: json['description_en'] as dynamic,
      categoryId: json['categoryID'] as String?,
      image: json['image'] as String?,
      website: json['website'] as String?,
      status: json['status'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      categoryname: json['categoryname'] as String?,
      facbook: json['facebook'],
      instgram: json['instagram'],
      phone: json['phone'],
      twitter: json['twitter'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'title_en': titleEn,
        'description': description,
        'description_en': descriptionEn,
        'categoryID': categoryId,
        'image': image,
        'website': website,
        'status': status,
        'updated_at': updatedAt,
        'created_at': createdAt,
        'categoryname': categoryname,
      };

  @override
  List<Object?> get props {
    return [
      id,
      title,
      titleEn,
      description,
      descriptionEn,
      categoryId,
      image,
      website,
      status,
      updatedAt,
      createdAt,
      categoryname,
    ];
  }
}
