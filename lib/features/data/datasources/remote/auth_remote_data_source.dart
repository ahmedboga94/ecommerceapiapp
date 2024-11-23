import 'package:dartz/dartz.dart';

import '../../../../core/constants/app_server_links.dart';
import '../../../../core/services/api_service.dart';
import '../../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<Unit> login(UserModel user);
  Future<Map<String, dynamic>> signUp(UserModel user);
  Future<Map<String, dynamic>> verfiyCode(UserModel user);
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
  Future<Map<String, dynamic>> signUp(UserModel user) async {
    var response = await apiService.post(
      endPoint: AppServerLinks.signupUrl,
      body: user.toJson(),
    );
    return response;
  }

  @override
  Future<Map<String, dynamic>> verfiyCode(UserModel user) async {
    var response = await apiService.post(
      endPoint: AppServerLinks.verfiyCodeUrl,
      body: user.toJson(),
    );
    return response;
  }
}
