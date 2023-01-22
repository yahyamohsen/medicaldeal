class UserModel {
  int? id;
  String? name;
  dynamic email;
  dynamic photo;
  dynamic emailVerifiedAt;
  String? phone;
  String? role;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.photo,
    this.emailVerifiedAt,
    this.phone,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as dynamic,
        photo: json['photo'] as dynamic,
        emailVerifiedAt: json['email_verified_at'] as dynamic,
        phone: json['phone'] as String?,
        role: json['role'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'photo': photo,
        'email_verified_at': emailVerifiedAt,
        'phone': phone,
        'role': role,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
