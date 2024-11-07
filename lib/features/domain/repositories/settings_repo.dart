import 'package:dartz/dartz.dart';

import '../../../core/enums/language_enum.dart';
import '../../../core/enums/theme_enum.dart';
import '../../../core/utils/failure.dart';

abstract class SettingsRepo {
  Either<Failure, Unit> setTheme(ThemeEnum theme);
  Either<Failure, Unit> setLanguage(LangEnum lang);
}
