import 'package:equatable/equatable.dart';

class ChapterSelectionEntity extends Equatable {
  final bool? error;
  final String? chapterCode;
  final String? nextChapterNo;

  const ChapterSelectionEntity({this.error, this.chapterCode, this.nextChapterNo});

  @override
  List<Object?> get props => [error, chapterCode, nextChapterNo];
}
