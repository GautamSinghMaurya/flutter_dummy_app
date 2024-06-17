
import 'package:flutter/widgets.dart';

import 'my_app.dart';
import 'network/global.dart';
import 'network/url.dart';

void main() {
  Global.baseURL = Url.devURL;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}