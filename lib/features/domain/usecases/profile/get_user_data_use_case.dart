import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure.dart';
import '../../entities/user_entity.dart';
import '../../repositories/profile_repo.dart';

class GetUserDataUseCase {
  final ProfileRepo _profileRepo;

  GetUserDataUseCase(this._profileRepo);

  Either<Failure, UserEntity?> call() {
    return _profileRepo.getUserData();
  }
}
