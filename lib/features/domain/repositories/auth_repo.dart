import 'package:dartz/dartz.dart';

import '../../../core/utils/failure.dart';
import '../entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, Unit>> login(UserEntity user);
  Future<Either<Failure, Map<String, dynamic>>> signUp(UserEntity user);
  Future<Either<Failure, String>> verfiyCode(UserEntity user);
}
