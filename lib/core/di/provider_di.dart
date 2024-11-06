import 'package:ecommerceapiapp/core/di/init_di.dart';
import 'package:ecommerceapiapp/features/presentation/provider/settings/language_provider.dart';

providerDi() {
  // settings
  di.registerFactory(() => LanguageProvider(
        getLanguageUseCase: di(),
        saveLanguageUseCase: di(),
      ));
}
