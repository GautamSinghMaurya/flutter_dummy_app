import 'package:equatable/equatable.dart';
import '../../../domain/entities/chapter/fetch_chapter/chapter_listings_entity.dart';

abstract class ChapterState extends Equatable {
  @override
  List<Object?> get props => [];}

class ChapterInitial extends ChapterState{
  @override
  List<Object?> get props => [];

}

class ChapterLoading extends ChapterState{
  @override
  List<Object?> get props => [];

}

class ChapterCheckBoxLoading extends ChapterState{
  @override
  List<Object?> get props => [];
}


class ChapterCheckBoxLoaded extends ChapterState{
  final String msg;
  final ChapterListingsEntity? chapters;

  ChapterCheckBoxLoaded({required this.msg, required this.chapters});

  @override
  List<Object?> get props => [msg];

}

class ChapterError extends ChapterState{
  final String error;

  ChapterError({required this.error});

  @override
  List<Object?> get props => [error];
}

class ChapterSuccess extends ChapterState{
  final ChapterListingsEntity? chapters;

  ChapterSuccess({required this.chapters});

  @override
  List<Object?> get props => [chapters];

}