import 'package:collection/collection.dart';

class BranchModel {
  String? id;
  String? serviceProviderId;
  String? addressAr;
  String? addressEn;
  String? locationLat;
  String? locationLng;
  String? city;
  String? governorateId;
  String? phone1;
  dynamic phone2;
  dynamic phone3;
  dynamic phone4;
  String? updatedAt;
  String? createdAt;

  BranchModel({
    this.id,
    this.serviceProviderId,
    this.addressAr,
    this.addressEn,
    this.locationLat,
    this.locationLng,
    this.city,
    this.governorateId,
    this.phone1,
    this.phone2,
    this.phone3,
    this.phone4,
    this.updatedAt,
    this.createdAt,
  });

  factory BranchModel.fromJson(Map<String, dynamic> json) => BranchModel(
        id: json['id'] as String?,
        serviceProviderId: json['service_provider_id'] as String?,
        addressAr: json['address_ar'] as String?,
        addressEn: json['address_en'] as String?,
        locationLat: json['location_lat'] as String?,
        locationLng: json['location_lng'] as String?,
        city: json['city'] as String?,
        governorateId: json['governorate_id'] as String?,
        phone1: json['phone1'] as String?,
        phone2: json['phone2'] as dynamic,
        phone3: json['phone3'] as dynamic,
        phone4: json['phone4'] as dynamic,
        updatedAt: json['updated_at'] as String?,
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'service_provider_id': serviceProviderId,
        'address_ar': addressAr,
        'address_en': addressEn,
        'location_lat': locationLat,
        'location_lng': locationLng,
        'city': city,
        'governorate_id': governorateId,
        'phone1': phone1,
        'phone2': phone2,
        'phone3': phone3,
        'phone4': phone4,
        'updated_at': updatedAt,
        'created_at': createdAt,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! BranchModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      serviceProviderId.hashCode ^
      addressAr.hashCode ^
      addressEn.hashCode ^
      locationLat.hashCode ^
      locationLng.hashCode ^
      city.hashCode ^
      governorateId.hashCode ^
      phone1.hashCode ^
      phone2.hashCode ^
      phone3.hashCode ^
      phone4.hashCode ^
      updatedAt.hashCode ^
      createdAt.hashCode;
}
