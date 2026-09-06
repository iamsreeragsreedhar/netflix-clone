import 'package:court_flix/core/error/Failure.dart';
import 'package:court_flix/feature/homePage/Data/datasource/movie_data_source.dart';

import '../../Domain/entity/movie_entity.dart';
import '../../Domain/repository/movie_repository.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart' hide Failure, ServerFailure;
import '../../Domain/entity/movie_entity.dart';
import '../../Domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getTrendingMovies() async {
    try {
      final movies = await remoteDataSource.getTrendingMovies();

      return Right(movies);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> nowPlayingMovies() async {
    try {
      final movies = await remoteDataSource.nowPlayingMovies();

      return Right(movies);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> popularMovies() async {
    try {
      final movies = await remoteDataSource.popularMovies();

      return Right(movies);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> topRatedMovies() async {
    try {
      final movies = await remoteDataSource.topRatedMovies();

      return Right(movies);
    } catch (e) {
      
      return Left(ServerFailure());
    }
  }
}
