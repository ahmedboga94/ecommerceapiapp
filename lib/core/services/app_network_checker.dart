import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class AppNetworkChecker {
  Future<bool> get isConnected;
}

class AppNetworkCheckerImpl implements AppNetworkChecker {
  final InternetConnectionChecker internetConnectionChecker;

  AppNetworkCheckerImpl(this.internetConnectionChecker);
  @override
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;
}
