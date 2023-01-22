import 'package:equatable/equatable.dart';

class ReviewModel extends Equatable {
  final String? id;
  final String? userId;
  final String? serviceProviderId;
  final String? reviewTitle;
  final String? reviewComment;
  final String? rate;
  final String? status;
  final String? updatedAt;
  final String? createdAt;
  final String? name;

  const ReviewModel({
    this.id,
    this.userId,
    this.serviceProviderId,
    this.reviewTitle,
    this.reviewComment,
    this.rate,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.name,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        id: json['id'] as String?,
        userId: json['user_id'] as String?,
        serviceProviderId: json['service_provider_id'] as String?,
        reviewTitle: json['review_title'] as String?,
        reviewComment: json['review_comment'] as String?,
        rate: json['rate'] as String?,
        status: json['status'] as String?,
        updatedAt: json['updated_at'] as String?,
        createdAt: json['created_at'] as String?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'service_provider_id': serviceProviderId,
        'review_title': reviewTitle,
        'review_comment': reviewComment,
        'rate': rate,
        'status': status,
        'updated_at': updatedAt,
        'created_at': createdAt,
        'name': name,
      };

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      serviceProviderId,
      reviewTitle,
      reviewComment,
      rate,
      status,
      updatedAt,
      createdAt,
      name,
    ];
  }
}
