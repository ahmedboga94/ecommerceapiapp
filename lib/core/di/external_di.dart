import 'package:dio/dio.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/api_service.dart';
import '../services/app_network_checker.dart';
import 'init_di.dart';

externalDi() async {
  final sharedPref = await SharedPreferences.getInstance();

  di.registerLazySingleton<AppNetworkChecker>(
      () => AppNetworkCheckerImpl(di()));
  di.registerLazySingleton<ApiService>(() => ApiService(di()));

  di.registerLazySingleton(() => sharedPref);
  di.registerLazySingleton(() => Dio());
  di.registerLazySingleton(() => InternetConnection());
}
