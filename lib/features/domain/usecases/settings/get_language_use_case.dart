import 'package:dartz/dartz.dart';

import '../../../../core/enums/language_enum.dart';
import '../../../../core/utils/failure.dart';
import '../../repositories/settings_repo.dart';

class GetLanguageUseCase {
  final SettingsRepo settingsRepo;

  GetLanguageUseCase(this.settingsRepo);

  Future<Either<Failure, LangEnum>> call() {
    return settingsRepo.getLanguage();
  }
}
