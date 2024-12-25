import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';
import '../../entities/user_entity.dart';
import '../../repositories/profile_repo.dart';

class GetUserDataUseCase {
  final ProfileRepo profileRepo;

  GetUserDataUseCase(this.profileRepo);

  Either<Failure, UserEntity?> call() {
    return profileRepo.getUserData();
  }
}
