import 'package:equatable/equatable.dart';

import 'chapter_details_entity.dart';

class ChapterListingsEntity extends Equatable {

  final List<ChapterDetailsEntity>? chapters;

  const ChapterListingsEntity({this.chapters});

  @override
  List<Object?> get props => [chapters];


}