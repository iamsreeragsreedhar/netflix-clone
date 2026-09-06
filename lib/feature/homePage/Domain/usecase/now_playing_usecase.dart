import 'package:court_flix/core/error/Failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart' hide Failure;
import '../entity/movie_entity.dart';
import '../repository/movie_repository.dart';

class NowPlayingUsecase {
  final MovieRepository repository;

  NowPlayingUsecase(this.repository);

  Future<Either<Failure, List<MovieEntity>>> call() {
    return repository.nowPlayingMovies();
  }
}
