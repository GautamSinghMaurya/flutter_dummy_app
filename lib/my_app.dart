import 'package:demo_flutter_app/architecture/clean/features/injector.dart';
import 'package:demo_flutter_app/architecture/clean/features/presentation/bloc/chapter/chapter_bloc.dart';
import 'package:demo_flutter_app/architecture/clean/features/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'architecture/clean/core/constants/app_strings.dart';
import 'architecture/clean/features/presentation/screen/login/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(create: (context) => injector<LoginBloc>()),
          BlocProvider<ChapterBloc>(
              create: (context) => injector<ChapterBloc>())
        ],
        child:

            // return // Platform.isAndroid ?
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
        );
  }
}
