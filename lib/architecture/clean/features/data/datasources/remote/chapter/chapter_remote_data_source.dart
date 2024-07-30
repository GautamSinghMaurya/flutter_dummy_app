import 'package:demo_flutter_app/architecture/clean/features/data/models/chapter/select_chapter/chapter_selection_model.dart';

import '../../../models/chapter/fetch_chapter/chapter_response.dart';

abstract class ChapterRemoteDataSource {

  Future<ChapterResponse> fetchChapters();
  Future<ChapterResponse> selectChapter();
  Future<ChapterSelectionModel> deSelectChapter({required int chapterId, required String password});

}