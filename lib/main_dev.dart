import 'package:demo_flutter_app/network/global.dart';
import 'package:demo_flutter_app/network/url.dart';
import 'package:flutter/widgets.dart';

import 'my_app.dart';

void main() {
  Global.baseURL = Url.devURL;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
