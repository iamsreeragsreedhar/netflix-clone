import 'package:court_flix/core/error/Failure.dart';
import 'package:court_flix/feature/search/domain/entity/comingsoon_entity.dart';
import 'package:court_flix/feature/search/domain/entity/search_enetity.dart';
import 'package:dartz/dartz.dart';

abstract class TopsearchRepository {
  Future<Either<Failure, List<topSearchEntity>>> getTopSearches(String query);
  Future<Either<Failure, List<commingSoonEntity>>> getComingSooons();
}
