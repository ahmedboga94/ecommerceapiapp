import 'package:dartz/dartz.dart';

import '../../../../core/enums/theme_enum.dart';
import '../../../core/enums/language_enum.dart';
import '../../../core/utils/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/profile_repo.dart';
import '../datasources/local/profile_local_storage.dart';
import '../models/user_model.dart';

class ProfileRepoImpl implements ProfileRepo {
  ProfileLocalStorage profileLocalStorage;
  ProfileRepoImpl(this.profileLocalStorage);

  @override
  Either<Failure, Unit> setTheme(ThemeEnum deviceTheme) {
    try {
      profileLocalStorage.setTheme(deviceTheme);
      return right(unit);
    } catch (e) {
      return left(Failure(message: "Error in setting theme"));
    }
  }

  @override
  Either<Failure, Unit> setLanguage(LangEnum deviceLang) {
    try {
      profileLocalStorage.setLanguage(deviceLang);
      return right(unit);
    } catch (e) {
      return left(Failure(message: "Error in setting Language"));
    }
  }

  @override
  Either<Failure, UserEntity?> getUserData() {
    try {
      UserModel? user = profileLocalStorage.getUserData();
      final userEntity = UserEntity(
        id: user!.id,
        userName: user.userName,
        email: user.email,
        password: user.phoneNumber,
        createdAt: user.createdAt,
      );
      return right(userEntity);
    } catch (e) {
      return left(Failure(message: "Error in getting User Data"));
    }
  }

  @override
  Either<Failure, Unit> clearUserData() {
    try {
      profileLocalStorage.clearUserData();
      return right(unit);
    } catch (e) {
      return left(Failure(message: "Error in clearing User Data"));
    }
  }
}
