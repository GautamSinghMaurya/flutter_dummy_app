import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class DioClient {
  final _dio = Dio();

  fetch({required Request request, required var path, var requestBody}) async {
    debugPrint(path);
    debugPrint(requestBody);
    var userData;
    switch (request) {
      case Request.post:
        userData = _dio.post(path);
        break;
      case Request.get:
        userData = _dio.get(path);
        break;
      default:
        userData = _dio.get(path);
        break;
    }
    return userData.data;
  }
}

enum Request { post, get, delete, patch, put }
