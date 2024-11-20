import '../../features/data/datasources/local/settings_local_storage.dart';
import '../../features/data/datasources/remote/auth_remote_data_source.dart';
import 'init_di.dart';

dataSourceDi() async {
// Remote
  di.registerLazySingleton<AuthRemoteDataSourceImpl>(
      () => AuthRemoteDataSourceImpl(di()));

// Local
  di.registerLazySingleton<SettingsLocalStorage>(
      () => SettingsLocalStorageImpl(di()));
}
