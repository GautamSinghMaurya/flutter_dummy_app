import 'package:demo_flutter_app/architecture/clean/core/network/dio_client.dart';
import 'package:demo_flutter_app/architecture/clean/features/data/datasources/remote/chapter/chapter_remote_data_source.dart';
import 'package:demo_flutter_app/architecture/clean/features/data/datasources/remote/chapter/chapter_remote_data_source_impl.dart';
import 'package:demo_flutter_app/architecture/clean/features/data/datasources/remote/login/login_data_source.dart';
import 'package:demo_flutter_app/architecture/clean/features/data/datasources/remote/login/login_data_source_impl.dart';
import 'package:demo_flutter_app/architecture/clean/features/data/repositories/chapter/chapter_repo_impl.dart';
import 'package:demo_flutter_app/architecture/clean/features/data/repositories/login/login_repo_impl.dart';
import 'package:demo_flutter_app/architecture/clean/features/domain/repositories/chapter_repo.dart';
import 'package:demo_flutter_app/architecture/clean/features/domain/usecases/chapter/chapter_usecases.dart';
import 'package:demo_flutter_app/architecture/clean/features/domain/usecases/login/login_usecases.dart';
import 'package:demo_flutter_app/architecture/clean/features/presentation/bloc/chapter/chapter_bloc.dart';
import 'package:demo_flutter_app/architecture/clean/features/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';

import 'domain/repositories/login_repo.dart';

final injector = GetIt.instance;

Future<void> init() async {
  injector
    // *Network
    ..registerLazySingleton<DioClient>(DioClient.new)

    // *NetworkDataSource
    ..registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl(injector()))
    ..registerLazySingleton<ChapterRemoteDataSource>(() => ChapterRemoteDataSourceImpl(injector()))
    // *LoginRepository
    ..registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(injector()))
    ..registerLazySingleton<ChapterRepo>(() => ChapterRepoImpl(injector()))
    // *LoginUseCases
    ..registerLazySingleton<LoginUseCases>(() => LoginUseCases(injector()))
    ..registerLazySingleton<ChapterUsecases>(() => ChapterUsecases(injector()))
    // *LoginBloc
    ..registerLazySingleton<LoginBloc>(() => LoginBloc(injector()))
    ..registerFactory<ChapterBloc>(() => ChapterBloc(injector()));
}
