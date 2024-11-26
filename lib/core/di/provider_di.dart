import '../../features/presentation/provider/auth/forget_password_provider.dart';
import '../../features/presentation/provider/auth/login_provider.dart';
import '../../features/presentation/provider/auth/reset_password_provider.dart';
import '../../features/presentation/provider/auth/reset_password_verfiy_provider.dart';
import '../../features/presentation/provider/auth/sign_up_provider.dart';
import '../../features/presentation/provider/auth/verfiy_code_provider.dart';
import '../../features/presentation/provider/settings/language_provider.dart';
import '../../features/presentation/provider/settings/theme_provider.dart';
import 'init_di.dart';

providerDi() {
  // settings
  di.registerFactory(() => ThemeProvider(di()));
  di.registerFactory(() => LanguageProvider(di()));

  // Auth
  di.registerFactory(() => SignUpProvider(di()));
  di.registerFactory(() => VerfiyCodeProvider(di()));
  di.registerFactory(() => LoginProvider(di()));
  di.registerFactory(() => ForgetPasswordProvider(di()));
  di.registerFactory(() => ResetPasswordVerfiyProvider(di()));
  di.registerFactory(() => ResetPasswordProvider(di()));
}
