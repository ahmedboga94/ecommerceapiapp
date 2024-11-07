import 'package:dartz/dartz.dart';

import '../../../../core/enums/language_enum.dart';
import '../../../../core/utils/failure.dart';
import '../../repositories/settings_repo.dart';

class SetLanguageUseCase {
  final SettingsRepo settingsRepo;

  SetLanguageUseCase(this.settingsRepo);

  Either<Failure, Unit> call(LangEnum lang) {
    return settingsRepo.setLanguage(lang);
  }
}
