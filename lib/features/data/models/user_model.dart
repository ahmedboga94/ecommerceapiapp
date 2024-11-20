import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    super.id,
    super.userName,
    super.email,
    super.phoneNumber,
    super.password,
    super.verfiycode,
    super.approve,
    super.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] as String,
      userName: json["userName"] as String,
      email: json["email"] as String,
      phoneNumber: json["phoneNumber"] as String,
      password: json["password"] as String,
      verfiycode: json["verfiycode"] as String,
      approve: json["approve"] as String,
      createdAt: json["createdAt"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userName": userName,
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password,
    };
  }
}
