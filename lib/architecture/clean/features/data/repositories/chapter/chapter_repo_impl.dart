import 'package:demo_flutter_app/architecture/clean/core/exceptions/network/network_exception.dart';
import 'package:demo_flutter_app/architecture/clean/features/data/datasources/remote/chapter/chapter_remote_data_source.dart';
import 'package:demo_flutter_app/architecture/clean/features/domain/entities/chapter/chapter_selection/chapter_selection_entity.dart';
import 'package:demo_flutter_app/architecture/clean/features/domain/repositories/chapter_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/src/either.dart';

import '../../../domain/entities/chapter/fetch_chapter/chapter_listings_entity.dart';

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
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, ChapterSelectionEntity>> deselectChapter({required int chapterId, required String password}) async {
    try {
      final result = await _chapterRemoteDataSource.deSelectChapter(chapterId: chapterId, password: password);
      if(result.error!) {
       return Left(NetworkException.fromResponseValidation(200, "id is required"));
      } else {
       return Right(result.toEntity());
      }
    } on DioException catch (e) {
      debugPrint("ChapterRepoImpl-deselectChapter-error:$e");
      return Left(NetworkException.fromDioError(e));
    }
  }

}