import 'package:demo_flutter_app/architecture/clean/features/domain/entities/chapter/chapter_selection/chapter_selection_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chapter_selection_model.g.dart';

@JsonSerializable()
class ChapterSelectionModel extends Equatable {
  @JsonKey(name: 'error')
  final bool? error;
  @JsonKey(name: 'firm_code')
  final String? chapterCode;
  @JsonKey(name: 'next_invoice_no')
  final String? nextChapterNo;

  const ChapterSelectionModel(
      {this.error, this.chapterCode, this.nextChapterNo});

  factory ChapterSelectionModel.fromJson(Map<String, dynamic> json) =>
      _$ChapterSelectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterSelectionModelToJson(this);

  toEntity() => ChapterSelectionEntity(
      error: error, chapterCode: chapterCode, nextChapterNo: nextChapterNo);

  @override
  List<Object?> get props => [error, chapterCode, nextChapterNo];
}
