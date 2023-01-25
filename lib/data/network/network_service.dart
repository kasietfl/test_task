import 'package:dio/dio.dart';

class NetworkService {
  final Dio _dio;

  NetworkService({required Dio dio}) : _dio = dio;

  Future<Response<T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.get(
      url,
      queryParameters: queryParameters,
    );
  }

  Future<Response<T>> post<T>(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.post(url, data: data, queryParameters: queryParameters);
  }

  Future<Response<T>> delete<T>(String url,
      {data, Map<String, dynamic>? queryParameters}) async {
    return await _dio.delete(url, data: data, queryParameters: queryParameters);
  }
}
