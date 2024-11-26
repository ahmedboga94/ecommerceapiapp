import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';
import '../../entities/user_entity.dart';
import '../../repositories/auth_repo.dart';

class ResetPasswordVerfiyUseCase {
  final AuthRepo authRepo;

  ResetPasswordVerfiyUseCase(this.authRepo);

  Future<Either<Failure, Map<String, dynamic>>> call(UserEntity user) {
    return authRepo.resetPasswordVerfiy(user);
  }
}
