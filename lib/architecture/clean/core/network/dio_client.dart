import 'dart:io';

import 'package:demo_flutter_app/architecture/clean/core/constants/app_constants.dart';
import 'package:dio/dio.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
    _dio = Dio();

    _dio
      ..options.baseUrl = AppConstants.baseUrl
      ..options.headers = {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
        HttpHeaders.authorizationHeader: 'Bearer ${AppConstants.apiToken}',
      }
      ..options.connectTimeout = const Duration(milliseconds: 15000)
      ..options.receiveTimeout = const Duration(milliseconds: 15000)
      ..options.responseType = ResponseType.json;
  }

  /// *GET
  Future<Response<dynamic>> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParameters);
      return response;
    } on DioException {
      rethrow;
    }
  }

  /// *POST
  Future<Response<dynamic>> post(String url, {data}) async {
    try {
      print(_dio.options.baseUrl);
      print(url);
      final response = await _dio.post(url, data: data);
      print(response);
      return response;
    } on DioException {
      rethrow;
    }
  }
}
