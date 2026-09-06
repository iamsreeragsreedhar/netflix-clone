import 'package:court_flix/core/error/Failure.dart';
import 'package:court_flix/feature/search/data/data_source/search_datasource.dart';
import 'package:court_flix/feature/search/domain/entity/comingsoon_entity.dart';
import 'package:court_flix/feature/search/domain/entity/search_enetity.dart';
import 'package:court_flix/feature/search/domain/repository/topsearch_repository.dart';
import 'package:dartz/dartz.dart';

class TopsearchRepoimpl implements TopsearchRepository {
  final topSearchDatasource search;

  TopsearchRepoimpl({required this.search});

  @override
  Future<Either<Failure, List<topSearchEntity>>> getTopSearches(String query) async {
    try {
      final result = await search.getTopseaches(query);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<commingSoonEntity>>> getComingSooons() async {
    try {
      final result = await search.getComingSooons();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
