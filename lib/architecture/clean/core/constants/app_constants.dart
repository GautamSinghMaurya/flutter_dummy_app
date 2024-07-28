import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {

  static final String baseUrl = '${dotenv.env['BASE_URL']}';
  static final String apiToken = '${dotenv.env['API_TOKEN']}';

}