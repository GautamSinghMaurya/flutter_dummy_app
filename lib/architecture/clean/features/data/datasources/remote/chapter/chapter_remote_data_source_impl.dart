import 'package:demo_flutter_app/architecture/clean/core/constants/url_constants.dart';
import 'package:demo_flutter_app/architecture/clean/core/network/dio_client.dart';
import 'package:demo_flutter_app/architecture/clean/features/data/datasources/remote/chapter/chapter_remote_data_source.dart';
import 'package:demo_flutter_app/architecture/clean/features/data/models/chapter/chapter_response.dart';

class ChapterRemoteDataSourceImpl extends ChapterRemoteDataSource {

  final DioClient _dioClient;
  ChapterRemoteDataSourceImpl(this._dioClient);

  @override
  Future<ChapterResponse> fetchChapters() async {
    try {
      final response = await _dioClient.post(UrlConstants.firmList);
      return ChapterResponse.fromJson(response.data as Map<String, dynamic>);
    } catch (_) {
      rethrow;
    }
  }

}