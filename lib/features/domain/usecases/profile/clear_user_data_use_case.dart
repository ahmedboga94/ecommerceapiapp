import 'package:dartz/dartz.dart';
import '../../../../core/utils/failure.dart';
import '../../repositories/profile_repo.dart';

class ClearUserDataUseCase {
  final ProfileRepo profileRepo;

  ClearUserDataUseCase(this.profileRepo);

  Either<Failure, Unit> call() {
    return profileRepo.clearUserData();
  }
}
