import 'package:court_flix/core/error/Failure.dart';

import '../entity/movie_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getTrendingMovies();
  Future<Either<Failure, List<MovieEntity>>> popularMovies();
  Future<Either<Failure, List<MovieEntity>>> nowPlayingMovies();
  Future<Either<Failure, List<MovieEntity>>> topRatedMovies();
}
