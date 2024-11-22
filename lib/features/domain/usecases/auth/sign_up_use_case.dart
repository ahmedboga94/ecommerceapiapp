import 'package:dartz/dartz.dart';
import 'package:ecommerceapiapp/core/utils/failure.dart';
import 'package:ecommerceapiapp/features/domain/repositories/auth_repo.dart';

import '../../entities/user_entity.dart';

class SignUpUseCase {
  final AuthRepo authRepo;

  SignUpUseCase(this.authRepo);

  Future<Either<Failure, Map<String, dynamic>>> call(UserEntity user) {
    return authRepo.signUp(user);
  }
}
