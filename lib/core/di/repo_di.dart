import '../../features/data/repositories/settings_repo_impl.dart';
import '../../features/domain/repositories/settings_repo.dart';
import 'init_di.dart';

repoDi() {
  di.registerLazySingleton<SettingsRepo>(() => SettingsRepoImpl(di()));
}
