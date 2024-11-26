import 'dart:convert';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    Response response = await _dio.get(endPoint);
    return json.decode(response.data);
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint, Map<String, dynamic>? body}) async {
    Response response =
        await _dio.post(endPoint, data: FormData.fromMap(body!));

    return json.decode(response.data);
  }
}
