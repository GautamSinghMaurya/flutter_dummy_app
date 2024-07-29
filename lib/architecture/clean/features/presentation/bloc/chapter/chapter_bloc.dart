import 'package:demo_flutter_app/architecture/clean/features/presentation/bloc/chapter/chapter_event.dart';
import 'package:demo_flutter_app/architecture/clean/features/presentation/bloc/chapter/chapter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/chapter/chapter_usecases.dart';

class ChapterBloc extends Bloc<ChapterEvent, ChapterState> {
  final ChapterUsecases _chapterUseCases;

  ChapterBloc(this._chapterUseCases) : super(ChapterInitial()) {
    on((event, emit) async {
      if (event is ChapterFetching) {
        emit(ChapterInitial());
        emit(ChapterLoading());
        try {
          var result = await _chapterUseCases.fetchChapter();
          print(result);
          print(result);
          emit(ChapterLoaded());
          emit(result.fold((error) => ChapterError(error: error.message),
              (success) => ChapterSuccess(chapters: success)));
        } catch (_) {
          rethrow;
        }
      }
    });
  }
}
