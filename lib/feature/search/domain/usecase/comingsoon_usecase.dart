import 'package:court_flix/core/error/Failure.dart';
import 'package:court_flix/feature/search/domain/entity/comingsoon_entity.dart';
import 'package:court_flix/feature/search/domain/repository/topsearch_repository.dart';
import 'package:dartz/dartz.dart';

class ComingsoonUsecase {
  final TopsearchRepository repository;
  ComingsoonUsecase({required this.repository});

  Future<Either<Failure, List<commingSoonEntity>>> call() async {
    return await repository.getComingSooons();
  }
}
