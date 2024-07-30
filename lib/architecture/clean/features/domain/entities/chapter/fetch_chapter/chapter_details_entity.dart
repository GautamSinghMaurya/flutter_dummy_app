import 'package:equatable/equatable.dart';

class ChapterDetailsEntity extends Equatable {
  final int? chapterId;
  final String? chapterName;
  bool isSelected = false;

  ChapterDetailsEntity({this.chapterId, this.chapterName});

  @override
  List<Object?> get props => [chapterId, chapterName, isSelected];


}