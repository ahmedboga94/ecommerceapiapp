import 'package:dartz/dartz.dart';

import '../../../../core/enums/theme_enum.dart';
import '../../../../core/utils/failure.dart';
import '../../repositories/profile_repo.dart';

class SetThemeUseCase {
  final ProfileRepo _profileRepo;

  SetThemeUseCase(this._profileRepo);

  Either<Failure, Unit> call(ThemeEnum theme) {
    return _profileRepo.setTheme(theme);
  }
}
