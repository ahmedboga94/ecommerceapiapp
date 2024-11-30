import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/services/app_network_checker.dart';
import '../../../core/utils/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repo.dart';
import '../datasources/local/profile_local_storage.dart';

import '../datasources/remote/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSourceImpl authRemoteDataSourceImpl;
  final ProfileLocalStorage profileLocalStorage;
  final AppNetworkChecker appNetworkChecker;
  AuthRepoImpl({
    required this.authRemoteDataSourceImpl,
    required this.profileLocalStorage,
    required this.appNetworkChecker,
  });

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
  Future<Either<Failure, Map<String, dynamic>>> verfiyCode(
      UserEntity user) async {
    if (await appNetworkChecker.isConnected) {
      try {
        final userModel =
            UserModel(email: user.email, verfiyCode: user.verfiyCode);
        final response = await authRemoteDataSourceImpl.verfiyCode(userModel);
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
  Future<Either<Failure, Map<String, dynamic>>> login(UserEntity user) async {
    if (await appNetworkChecker.isConnected) {
      try {
        final userModel = UserModel(email: user.email, password: user.password);
        final response = await authRemoteDataSourceImpl.login(userModel);
        if (response["status"] == "success") {
          profileLocalStorage.saveUserData(response["data"]);
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
  Future<Either<Failure, Map<String, dynamic>>> forgetPassword(
      UserEntity user) async {
    if (await appNetworkChecker.isConnected) {
      try {
        final userModel = UserModel(email: user.email);
        final response =
            await authRemoteDataSourceImpl.forgetPassword(userModel);
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
  Future<Either<Failure, Map<String, dynamic>>> resetPasswordVerfiy(
      UserEntity user) async {
    if (await appNetworkChecker.isConnected) {
      try {
        final userModel =
            UserModel(email: user.email, verfiyCode: user.verfiyCode);
        final response =
            await authRemoteDataSourceImpl.resetPassVerfiy(userModel);
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
  Future<Either<Failure, Map<String, dynamic>>> resetPasswordSuccess(
      UserEntity user) async {
    if (await appNetworkChecker.isConnected) {
      try {
        final userModel = UserModel(email: user.email, password: user.password);
        final response =
            await authRemoteDataSourceImpl.resetPassSuccess(userModel);
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
}
