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
      id: json["id"] as String,
      userName: json["name"] as String,
      email: json["email"] as String,
      phoneNumber: json["phone"] as String,
      password: json["password"] as String,
      verfiyCode: json["verfiyCode"] as String,
      approve: json["approve"] as String,
      createdAt: json["createdAt"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": userName,
      "email": email,
      "phone": phoneNumber,
      "password": password,
      "verfiyCode": verfiyCode,
    };
  }
}
