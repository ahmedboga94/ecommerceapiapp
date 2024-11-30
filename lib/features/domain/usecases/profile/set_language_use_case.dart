import 'package:dartz/dartz.dart';

import '../../../../core/enums/language_enum.dart';
import '../../../../core/utils/failure.dart';
import '../../repositories/profile_repo.dart';

class SetLanguageUseCase {
  final ProfileRepo profileRepo;

  SetLanguageUseCase(this.profileRepo);

  Either<Failure, Unit> call(LangEnum lang) {
    return profileRepo.setLanguage(lang);
  }
}
