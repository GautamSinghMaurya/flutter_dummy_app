import 'package:equatable/equatable.dart';

class ChapterDetailsEntity extends Equatable {
  final int? chapterId;
  final String? chapterName;
  final bool? isSelected;

  const ChapterDetailsEntity({this.chapterId, this.chapterName, this.isSelected});

  @override
  List<Object?> get props => [chapterId, chapterName, isSelected];


}