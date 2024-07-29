import 'package:equatable/equatable.dart';

import '../../../domain/entities/chapter/chapter_listings_entity.dart';

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

class ChapterLoaded extends ChapterState{
  @override
  List<Object?> get props => [];

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