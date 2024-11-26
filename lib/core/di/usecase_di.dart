import '../../features/domain/usecases/auth/forget_password_use_case.dart';
import '../../features/domain/usecases/auth/login_use_case.dart';
import '../../features/domain/usecases/auth/reset_password_use_case.dart';
import '../../features/domain/usecases/auth/reset_password_verfiy_use_case.dart';
import '../../features/domain/usecases/auth/sign_up_use_case.dart';
import '../../features/domain/usecases/auth/verify_code_use_case.dart';
import '../../features/domain/usecases/settings/set_language_use_case.dart';
import '../../features/domain/usecases/settings/set_theme_use_case.dart';
import 'init_di.dart';

useCaseDi() async {
  // Settings
  di.registerLazySingleton(() => SetThemeUseCase(di()));
  di.registerLazySingleton(() => SetLanguageUseCase(di()));

  // Auth
  di.registerLazySingleton(() => SignUpUseCase(di()));
  di.registerLazySingleton(() => VerifyCodeUseCase(di()));
  di.registerLazySingleton(() => LoginUseCase(di()));
  di.registerLazySingleton(() => ForgetPasswordUseCase(di()));
  di.registerLazySingleton(() => ResetPasswordVerfiyUseCase(di()));
  di.registerLazySingleton(() => ResetPasswordUseCase(di()));
}
