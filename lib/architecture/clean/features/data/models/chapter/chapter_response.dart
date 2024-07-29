import 'package:demo_flutter_app/architecture/clean/features/domain/entities/chapter/chapter_listings_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'chapter_model.dart';

part 'chapter_response.g.dart';

@JsonSerializable()
class ChapterResponse extends Equatable {
  final bool? error;
  @JsonKey(name: 'data')
  final List<ChapterModel>? chapters;

  const ChapterResponse({required this.error, required this.chapters});

  factory ChapterResponse.fromJson(Map<String, dynamic> json) =>
      _$ChapterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterResponseToJson(this);

  ChapterListingsEntity toEntity() => ChapterListingsEntity(
      chapters: chapters!.map((e) => e.toEntity()).toList());

  @override
  List<Object?> get props => [error, chapters];
}
