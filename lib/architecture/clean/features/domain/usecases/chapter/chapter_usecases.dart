import 'package:demo_flutter_app/architecture/clean/core/exceptions/network/network_exception.dart';
import 'package:demo_flutter_app/architecture/clean/features/domain/entities/chapter/chapter_selection/chapter_selection_entity.dart';
import 'package:demo_flutter_app/architecture/clean/features/domain/repositories/chapter_repo.dart';
import 'package:fpdart/fpdart.dart';

import '../../entities/chapter/fetch_chapter/chapter_listings_entity.dart';

class ChapterUsecases {
  final ChapterRepo _chapterRepo;

  ChapterUsecases(this._chapterRepo);

  Future<Either<NetworkException, ChapterListingsEntity>> fetchChapter() async {
    return _chapterRepo.fetchChapter();
  }

  Future<Either<NetworkException, ChapterSelectionEntity>> deSelectChapter(int chapterId) async {
    return _chapterRepo.deselectChapter(chapterId: chapterId, password: "123456");
  }

}