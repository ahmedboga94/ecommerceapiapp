import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    super.id,
    super.userName,
    super.email,
    super.phoneNumber,
    super.password,
    super.verfiyCode,
    super.approve,
    super.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["user_id"] as String,
      userName: json["user_name"] as String,
      email: json["user_email"] as String,
      phoneNumber: json["user_phone"] as String,
      password: json["user_password"] as String,
      verfiyCode: json["user_verfiycode"] as String,
      approve: json["user_approve"] as String,
      createdAt: json["user_created"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user_name": userName,
      "user_email": email,
      "user_phone": phoneNumber,
      "user_password": password,
      "user_verfiycode": verfiyCode,
    };
  }
}
