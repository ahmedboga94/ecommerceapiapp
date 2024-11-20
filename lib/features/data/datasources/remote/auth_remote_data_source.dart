import 'package:dartz/dartz.dart';

import '../../../../core/constants/app_server_links.dart';
import '../../../../core/services/api_service.dart';
import '../../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<Unit> login(UserModel user);
  Future<Unit> signUp(UserModel user);
  Future<Unit> verfiyCode(UserModel user);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;
  AuthRemoteDataSourceImpl(this.apiService);

  @override
  Future<Unit> login(UserModel user) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Unit> signUp(UserModel user) async {
    final data = {
      "userName": user.userName,
      "email": user.email,
      "phone": user.email,
      "password": user.password,
    };
    await apiService.post(endPoint: AppServerLinks.signupUrl, body: data);
    return Future.value(unit);
  }

  @override
  Future<Unit> verfiyCode(UserModel user) {
    // TODO: implement verfiyCode
    throw UnimplementedError();
  }
}
