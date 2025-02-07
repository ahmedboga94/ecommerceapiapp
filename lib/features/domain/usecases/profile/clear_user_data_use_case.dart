import 'package:dartz/dartz.dart';
import '../../../../core/utils/failure.dart';
import '../../repositories/profile_repo.dart';

class ClearUserDataUseCase {
  final ProfileRepo _profileRepo;

  ClearUserDataUseCase(this._profileRepo);

  Either<Failure, Unit> call() {
    return _profileRepo.clearUserData();
  }
}
