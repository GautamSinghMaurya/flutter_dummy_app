import 'package:demo_flutter_app/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen/login/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
      // home: LoginSScreen(),
    );
  }
}
