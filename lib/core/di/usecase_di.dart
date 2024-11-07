import '../../features/domain/usecases/settings/set_language_use_case.dart';
import '../../features/domain/usecases/settings/set_theme_use_case.dart';
import 'init_di.dart';

useCaseDi() async {
  di.registerLazySingleton(() => SetThemeUseCase(di()));
  di.registerLazySingleton(() => SetLanguageUseCase(di()));
}
