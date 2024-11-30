import 'package:dartz/dartz.dart';

import '../../../../core/enums/theme_enum.dart';
import '../../../../core/utils/failure.dart';
import '../../repositories/profile_repo.dart';

class SetThemeUseCase {
  final ProfileRepo profileRepo;

  SetThemeUseCase(this.profileRepo);

  Either<Failure, Unit> call(ThemeEnum theme) {
    return profileRepo.setTheme(theme);
  }
}
