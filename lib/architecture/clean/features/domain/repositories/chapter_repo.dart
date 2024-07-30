import 'package:demo_flutter_app/architecture/clean/core/exceptions/network/network_exception.dart';
import 'package:demo_flutter_app/architecture/clean/features/domain/entities/chapter/chapter_selection/chapter_selection_entity.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/chapter/fetch_chapter/chapter_listings_entity.dart';

abstract class ChapterRepo {
  Future<Either<NetworkException, ChapterListingsEntity>> fetchChapter();
  Future<Either<NetworkException, ChapterSelectionEntity>> deselectChapter({required int chapterId, required String password});
}