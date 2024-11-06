import 'package:dartz/dartz.dart';

import '../../../core/enums/language_enum.dart';
import '../../../core/utils/failure.dart';

abstract class SettingsRepo {
  Future<Either<Failure, LangEnum>> getLanguage();
  Future<Either<Failure, void>> saveLanguage(LangEnum lang);
}
