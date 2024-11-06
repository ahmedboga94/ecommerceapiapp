import 'package:dartz/dartz.dart';

import '../../../../core/enums/language_enum.dart';
import '../../../../core/utils/failure.dart';
import '../../repositories/settings_repo.dart';

class SaveLanguageUseCase {
  final SettingsRepo settingsRepo;

  SaveLanguageUseCase(this.settingsRepo);

  Future<Either<Failure, void>> call(LangEnum lang) {
    return settingsRepo.saveLanguage(lang);
  }
}
