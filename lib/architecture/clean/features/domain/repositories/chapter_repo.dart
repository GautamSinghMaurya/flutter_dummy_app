import 'package:demo_flutter_app/architecture/clean/core/exceptions/network/network_exception.dart';
import 'package:demo_flutter_app/architecture/clean/features/domain/entities/chapter/chapter_listings_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class ChapterRepo {
  Future<Either<NetworkException, ChapterListingsEntity>> fetchChapter();
}