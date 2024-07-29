import '../../../models/chapter/chapter_response.dart';

abstract class ChapterRemoteDataSource {
  Future<ChapterResponse> fetchChapters();

}