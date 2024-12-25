import '../../features/data/repositories/auth_repo_impl.dart';
import '../../features/data/repositories/home_repo_impl.dart';
import '../../features/data/repositories/profile_repo_impl.dart';
import '../../features/domain/repositories/auth_repo.dart';
import '../../features/domain/repositories/home_repo.dart';
import '../../features/domain/repositories/profile_repo.dart';
import 'init_di.dart';

repoDi() {
  di.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(
        authRemoteDataSource: di(),
        profileLocalStorage: di(),
        appNetworkChecker: di(),
      ));

  di.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(
        homeRemoteDataSource: di(),
        appNetworkChecker: di(),
      ));

  di.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(
        profileLocalStorage: di(),
        profileRemoteDataSource: di(),
        appNetworkChecker: di(),
      ));
}
