import 'package:court_flix/core/error/Failure.dart';
import 'package:court_flix/feature/search/domain/entity/search_enetity.dart';
import 'package:court_flix/feature/search/domain/repository/topsearch_repository.dart';
import 'package:dartz/dartz.dart';

class TopsearchUsecase {
  final TopsearchRepository repository;
  TopsearchUsecase({required this.repository});

  Future<Either<Failure, List<topSearchEntity>>> call(String query) {
    return repository.getTopSearches(query);
  }
}
