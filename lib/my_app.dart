import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'architecture/clean/data/constants/app_strings.dart';
import 'package:demo_flutter_app/architecture/clean/presentation/screen/login/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return // Platform.isAndroid ?
      GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: LoginScreen(),
          )
        // : GetCupertinoApp(
        //     debugShowCheckedModeBanner: false,
        //     title: AppStrings.appName,
        //     home: LoginScreen(),
        //   )
    ;
  }
}
