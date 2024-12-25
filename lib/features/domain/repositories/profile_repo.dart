import 'package:dartz/dartz.dart';

import '../../../core/enums/language_enum.dart';
import '../../../core/enums/theme_enum.dart';
import '../../../core/utils/failure.dart';
import '../entities/item_entity.dart';
import '../entities/user_entity.dart';

abstract class ProfileRepo {
  Either<Failure, UserEntity?> getUserData();
  Either<Failure, Unit> clearUserData();
  Future<Either<Failure, List<ItemEntity>>> getUserFavoriteItems();
  Either<Failure, Unit> setTheme(ThemeEnum theme);
  Either<Failure, Unit> setLanguage(LangEnum lang);
}
