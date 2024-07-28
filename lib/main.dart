import 'package:demo_flutter_app/architecture/clean/features/injector.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'my_app.dart';
import 'network/global.dart';
import 'network/url.dart';

void main() async {
  Global.baseURL = Url.devURL;
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await init();
  runApp(const MyApp());
}
