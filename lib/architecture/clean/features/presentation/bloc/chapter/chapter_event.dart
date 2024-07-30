import 'package:equatable/equatable.dart';

abstract class ChapterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChapterFetching extends ChapterEvent {

  @override
  List<Object?> get props => [];

}

class ChapterSelecting extends ChapterEvent {
  final int chapterId;

  ChapterSelecting({required this.chapterId});

  @override
  List<Object?> get props => [chapterId];

}

class ChapterDeSelecting extends ChapterEvent {
  final int chapterId;

  ChapterDeSelecting({required this.chapterId});

  @override
  List<Object?> get props => [chapterId];

}