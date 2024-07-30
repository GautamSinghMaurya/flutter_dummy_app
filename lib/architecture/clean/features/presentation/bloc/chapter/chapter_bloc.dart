import 'package:demo_flutter_app/architecture/clean/features/presentation/bloc/chapter/chapter_event.dart';
import 'package:demo_flutter_app/architecture/clean/features/presentation/bloc/chapter/chapter_state.dart';
import 'package:flutter/material.dart';
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
          emit(result.fold((error) => ChapterError(error: error.message),
              (success) => ChapterSuccess(chapters: success)));
        } catch (_) {
          rethrow;
        }
      } else if (event is ChapterSelecting) {
        try {
          final currentStates = state as ChapterSuccess;
          currentStates.chapters!.chapters!.forEach((e) {
            if (e.chapterId == event.chapterId) {
              e.isSelected = true;
            }
          });
          emit(ChapterInitial());
          emit(ChapterSuccess(chapters: currentStates.chapters!));
        } catch (_) {
          rethrow;
        }
      } else if (event is ChapterDeSelecting) {
        try {
          final currentStates = state as ChapterSuccess;
          emit(ChapterCheckBoxLoading());
          final result =
              await _chapterUseCases.deSelectChapter(event.chapterId);
          emit(result.fold((error) => ChapterError(error: error.message),
              (success) {
            currentStates.chapters!.chapters!.forEach((e) {
              if (e.chapterId == event.chapterId) {
                e.isSelected = false;
              }
            });
            return ChapterCheckBoxLoaded(
                msg: "deselected successfully",
                chapters: currentStates.chapters!);
          }));
        } catch (_) {
          print("calling->catch");
          rethrow;
        }
      }
    });
  }
}
