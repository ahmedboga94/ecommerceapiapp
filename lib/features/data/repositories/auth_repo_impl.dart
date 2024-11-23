import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/services/app_network_checker.dart';
import '../../../core/utils/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repo.dart';
import '../datasources/remote/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSourceImpl authRemoteDataSourceImpl;
  final AppNetworkChecker appNetworkChecker;
  AuthRepoImpl({
    required this.authRemoteDataSourceImpl,
    required this.appNetworkChecker,
  });

  @override
  Future<Either<Failure, Unit>> login(UserEntity user) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> signUp(UserEntity user) async {
    if (await appNetworkChecker.isConnected) {
      try {
        final userModel = UserModel(
          userName: user.userName,
          email: user.email,
          phoneNumber: user.phoneNumber,
          password: user.password,
        );
        final response = await authRemoteDataSourceImpl.signUp(userModel);
        if (response["status"] == "success") {
          return right(response);
        } else {
          return left(Failure(message: response["message"]));
        }
      } catch (e) {
        if (e is DioException) {
          return left(ServerFaliure.fromDioError(e));
        } else {
          return left(ServerFaliure(message: "$e"));
        }
      }
    } else {
      return left(
        OfflineFailure(message: "Your Device is not connecting to Internet"),
      );
    }
  }

  @override
  Future<Either<Failure, String>> verfiyCode(UserEntity user) {
    // TODO: implement verfiyCode
    throw UnimplementedError();
  }
}
