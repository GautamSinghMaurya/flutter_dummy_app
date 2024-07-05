import 'package:demo_flutter_app/network/dio_client.dart';
import 'package:demo_flutter_app/network/url.dart';

class AppServices {
  Future<Map?> login(Map<String, dynamic> requestBody) async {
    try {
      final loginResponse = await DioClient().fetch(
          request: Request.post, requestBody: requestBody, path: Url.login);
      return loginResponse;
    } catch (e) {
      return null;
    }
  }
}
