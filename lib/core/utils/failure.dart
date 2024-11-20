import 'package:dio/dio.dart';

class Failure {
  final String message;
  Failure({required this.message});
}

class OfflineFailure extends Failure {
  OfflineFailure({required super.message});
}

class ServerFaliure extends Failure {
  ServerFaliure({required super.message});

  factory ServerFaliure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFaliure(message: "Connection time out, please try again");
      case DioExceptionType.sendTimeout:
        return ServerFaliure(message: "Send time out, please try again");
      case DioExceptionType.receiveTimeout:
        return ServerFaliure(message: "Receive time out, please try again");
      case DioExceptionType.badCertificate:
        return ServerFaliure(message: "Bad Certificate with API Server");
      case DioExceptionType.badResponse:
        return ServerFaliure.fromResponse(e);
      case DioExceptionType.cancel:
        return ServerFaliure(message: "Request to server was canceled");
      case DioExceptionType.connectionError:
        return ServerFaliure(message: "No Internet Connection");
      case DioExceptionType.unknown:
        return ServerFaliure(
            message: "Opps There was an Error, please try again");
    }
  }

  factory ServerFaliure.fromResponse(DioException e) {
    if (e.response!.statusCode == 404) {
      return ServerFaliure(
          message: "Your request was not found, please try later");
    } else if (e.response!.statusCode == 500) {
      return ServerFaliure(
          message: "There is problem with Server, please try later");
    } else if (e.response!.statusCode == 400 ||
        e.response!.statusCode == 401 ||
        e.response!.statusCode == 403) {
      return ServerFaliure(message: e.response!.data["status"]);
    } else {
      return ServerFaliure(
          message: "Opps There was an Error, please try again");
    }
  }
}
