import '../../features/data/repositories/auth_repo_impl.dart';
import '../../features/data/repositories/profile_repo_impl.dart';
import '../../features/domain/repositories/auth_repo.dart';
import '../../features/domain/repositories/profile_repo.dart';
import 'init_di.dart';

repoDi() {
  di.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(di()));

  di.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(
        authRemoteDataSourceImpl: di(),
        profileLocalStorage: di(),
        appNetworkChecker: di(),
      ));
}
