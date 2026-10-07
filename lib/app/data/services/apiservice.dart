import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioService {
  late Dio dio;

  DioService() {
    dio = Dio(
      BaseOptions(
        baseUrl: dotenv.env['BASE_URL'] ?? '',
        contentType: kIsWeb
            ? 'application/x-www-form-urlencoded'
            : 'application/json',
        headers: {'Accept': 'application/json'},
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<Response> get(String path) async {
    try {
      final response = await dio.get(path);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(String path, dynamic data) async {
    try {
      final response = await dio.post(path, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(String path, dynamic data) async {
    try {
      final response = await dio.put(path, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(String path) async {
    try {
      final response = await dio.delete(path);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
