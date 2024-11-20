import '../../features/data/repositories/auth_repo_impl.dart';
import '../../features/data/repositories/settings_repo_impl.dart';
import '../../features/domain/repositories/auth_repo.dart';
import '../../features/domain/repositories/settings_repo.dart';
import 'init_di.dart';

repoDi() {
  di.registerLazySingleton<SettingsRepo>(() => SettingsRepoImpl(di()));

  di.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(
        authRemoteDataSourceImpl: di(),
        appNetworkChecker: di(),
      ));
}
