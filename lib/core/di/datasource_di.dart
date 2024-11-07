import '../../features/data/datasources/settings_local_storage.dart';
import 'init_di.dart';

dataSourceDi() async {
  di.registerLazySingleton<SettingsLocalStorage>(
      () => SettingsLocalStorageImpl(di()));
}
