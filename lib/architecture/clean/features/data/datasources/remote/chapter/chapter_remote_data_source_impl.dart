import 'package:demo_flutter_app/architecture/clean/core/constants/url_constants.dart';
import 'package:demo_flutter_app/architecture/clean/core/network/dio_client.dart';
import 'package:demo_flutter_app/architecture/clean/features/data/datasources/remote/chapter/chapter_remote_data_source.dart';
import 'package:demo_flutter_app/architecture/clean/features/data/models/chapter/fetch_chapter/chapter_response.dart';

import '../../../models/chapter/select_chapter/chapter_selection_model.dart';

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

  @override
  Future<ChapterSelectionModel> deSelectChapter({required int chapterId, required String password}) async {
    try {
      var data = {
        'id' : chapterId.toString(),
        'password' : password,
        'device_id' : 'testing...bpos_deviceid'
      };

      final response = await _dioClient.post(UrlConstants.firmDeSelection, data: data);
      return ChapterSelectionModel.fromJson(response.data as Map<String, dynamic>);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<ChapterResponse> selectChapter() async {
    throw UnimplementedError();
  }


}