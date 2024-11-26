import '../../../../core/constants/app_server_links.dart';
import '../../../../core/services/api_service.dart';
import '../../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(UserModel user);
  Future<Map<String, dynamic>> signUp(UserModel user);
  Future<Map<String, dynamic>> verfiyCode(UserModel user);
  Future<Map<String, dynamic>> forgetPassword(UserModel user);
  Future<Map<String, dynamic>> resetPassVerfiy(UserModel user);
  Future<Map<String, dynamic>> resetPassSuccess(UserModel user);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;
  AuthRemoteDataSourceImpl(this.apiService);

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

  @override
  Future<Map<String, dynamic>> login(UserModel user) async {
    var response = await apiService.post(
      endPoint: AppServerLinks.loginUrl,
      body: user.toJson(),
    );
    return response;
  }

  @override
  Future<Map<String, dynamic>> forgetPassword(UserModel user) async {
    var response = await apiService.post(
      endPoint: AppServerLinks.forgetPassUrl,
      body: user.toJson(),
    );
    return response;
  }

  @override
  Future<Map<String, dynamic>> resetPassVerfiy(UserModel user) async {
    var response = await apiService.post(
      endPoint: AppServerLinks.resetPassVerfiyUrl,
      body: user.toJson(),
    );
    return response;
  }

  @override
  Future<Map<String, dynamic>> resetPassSuccess(UserModel user) async {
    var response = await apiService.post(
      endPoint: AppServerLinks.resetPasssuccessUrl,
      body: user.toJson(),
    );
    return response;
  }
}
