import 'package:demo_flutter_app/architecture/clean/features/domain/entities/chapter/chapter_details_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chapter_model.g.dart';

@JsonSerializable()
class ChapterModel extends Equatable {
  @JsonKey(name: 'id')
  final int? chapterId;

  @JsonKey(name: 'name')
  final String? chapterName;

  const ChapterModel({required this.chapterId, this.chapterName});

  factory ChapterModel.fromJson(Map<String, dynamic> json) =>
      _$ChapterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterModelToJson(this);

  ChapterDetailsEntity toEntity() => ChapterDetailsEntity(
      chapterId: chapterId,
      chapterName: chapterName,
      isSelected: false);

  @override
  List<Object?> get props => [chapterId, chapterName];
}
