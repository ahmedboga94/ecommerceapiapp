import '../../features/data/datasources/local/profile_local_storage.dart';
import '../../features/data/datasources/remote/auth_remote_data_source.dart';
import '../../features/data/datasources/remote/home_remote_data_source.dart';
import '../../features/data/datasources/remote/profile_remote_data_source.dart';
import 'init_di.dart';

dataSourceDi() async {
// Remote
  di.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(di()));
  di.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(di()));
  di.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl(di()));

// Local
  di.registerLazySingleton<ProfileLocalStorage>(
      () => ProfileLocalStorageImpl(di()));
}
