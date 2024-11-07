import 'package:dartz/dartz.dart';

import '../../../../core/enums/theme_enum.dart';
import '../../../core/enums/language_enum.dart';
import '../../../core/utils/failure.dart';
import '../../domain/repositories/settings_repo.dart';
import '../datasources/settings_local_storage.dart';

class SettingsRepoImpl implements SettingsRepo {
  SettingsLocalStorage settingsLocalStorage;
  SettingsRepoImpl(this.settingsLocalStorage);

  @override
  Either<Failure, Unit> setTheme(ThemeEnum deviceTheme) {
    try {
      settingsLocalStorage.setTheme(deviceTheme);
      return right(unit);
    } catch (e) {
      return left(Failure("Error in setting theme"));
    }
  }

  @override
  Either<Failure, Unit> setLanguage(LangEnum deviceLang) {
    try {
      settingsLocalStorage.setLanguage(deviceLang);
      return right(unit);
    } catch (e) {
      return left(Failure("Error in setting Language"));
    }
  }
}
