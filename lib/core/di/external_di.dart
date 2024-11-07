import 'package:shared_preferences/shared_preferences.dart';

import 'init_di.dart';

externalDi() async {
  final sharedPref = await SharedPreferences.getInstance();
  di.registerLazySingleton(() => sharedPref);
}
