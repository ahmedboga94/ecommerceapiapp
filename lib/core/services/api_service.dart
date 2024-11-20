import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  post({required String endPoint, Map<String, dynamic>? body}) async {
    Response response = await _dio.post(endPoint, data: body);
    return response.data;
  }
}
