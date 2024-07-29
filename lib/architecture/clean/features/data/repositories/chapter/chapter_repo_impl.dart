import 'package:demo_flutter_app/architecture/clean/core/exceptions/network/network_exception.dart';
import 'package:demo_flutter_app/architecture/clean/features/data/datasources/remote/chapter/chapter_remote_data_source.dart';
import 'package:demo_flutter_app/architecture/clean/features/domain/entities/chapter/chapter_listings_entity.dart';
import 'package:demo_flutter_app/architecture/clean/features/domain/repositories/chapter_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/src/either.dart';

class ChapterRepoImpl extends ChapterRepo {
  final ChapterRemoteDataSource _chapterRemoteDataSource;

  ChapterRepoImpl(this._chapterRemoteDataSource);

  @override
  Future<Either<NetworkException, ChapterListingsEntity>> fetchChapter() async {
    try {
      final result = await _chapterRemoteDataSource.fetchChapters();
      if (!result.error!) {
        return Right(result.toEntity());
      } else {
        return left(NetworkException.fromResponseValidation(200, "no data found"));
      }
    } on DioException catch (e) {
      debugPrint("ChapterRepoImpl-fetchChapter-error:$e");
      return Left(NetworkException.fromDioError(e));
    }
  }
}