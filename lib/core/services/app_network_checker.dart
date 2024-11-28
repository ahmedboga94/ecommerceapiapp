import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class AppNetworkChecker {
  Future<bool> get isConnected;
}

class AppNetworkCheckerImpl implements AppNetworkChecker {
  final InternetConnection internetConnection;

  AppNetworkCheckerImpl(this.internetConnection);
  @override
  Future<bool> get isConnected => internetConnection.hasInternetAccess;
}
