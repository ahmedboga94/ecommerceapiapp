import 'package:dartz/dartz.dart';

import '../../../../core/enums/theme_enum.dart';
import '../../../../core/utils/failure.dart';
import '../../repositories/settings_repo.dart';

class SetThemeUseCase {
  final SettingsRepo settingsRepo;

  SetThemeUseCase(this.settingsRepo);

  Either<Failure, Unit> call(ThemeEnum theme) {
    return settingsRepo.setTheme(theme);
  }
}
