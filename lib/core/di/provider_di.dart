import '../../features/presentation/provider/settings/language_provider.dart';
import '../../features/presentation/provider/settings/theme_provider.dart';
import 'init_di.dart';

providerDi() {
  // settings
  di.registerFactory(() => ThemeProvider(di()));
  di.registerFactory(() => LanguageProvider(di()));
}
