import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';
import '../../entities/user_entity.dart';
import '../../repositories/auth_repo.dart';

class VerifyCodeUseCase {
  final AuthRepo authRepo;

  VerifyCodeUseCase(this.authRepo);

  Future<Either<Failure, String>> call(UserEntity user) {
    return authRepo.verfiyCode(user);
  }
}
