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

  @override
  List<Object?> get props => [];

}

class ChapterDeSelecting extends ChapterEvent {

  @override
  List<Object?> get props => [];

}