import 'dart:developer';

import 'package:court_flix/core/error/Failure.dart';
import 'package:court_flix/core/repository/api_constants.dart';
import 'package:court_flix/core/repository/dio_client.dart';
import 'package:court_flix/feature/homePage/Data/model/movie_model.dart';
import 'package:dio/dio.dart';

class MovieDataSource {
  final dioClient dio;

  MovieDataSource(this.dio);

  Future<List<MovieModel>> getTrendingMovies() async {
    try {
      final response = await dio.get(endpoint: '/trending/all/week', token: ApiConstants.token);

      final List results = response.data['results'];
      log("❌ getTrendingMovies ❌ $results");

      return results.map((json) => MovieModel.fromJson(json)).toList();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw NetworkFailure();
      }

      if (e.response?.statusCode != null) {
        throw ServerFailure();
      }

      throw UnknownFailure();
    } catch (e) {
      throw UnknownFailure();
    }
  }

  Future<List<MovieModel>> popularMovies() async {
    try {
      final response = await dio.get(endpoint: '/movie/popular', token: ApiConstants.token);

      final List results = response.data['results'];
      log(" ❌ popularMovies ❌$results");

      return results.map((json) => MovieModel.fromJson(json)).toList();
    } catch (e) {
      throw UnknownFailure();
    }
  }

  Future<List<MovieModel>> nowPlayingMovies() async {
    try {
      final response = await dio.get(endpoint: '/movie/now_playing', token: ApiConstants.token);

      final List results = response.data['results'];
      log("❌ nowPlayingMovies ❌$results");

      return results.map((json) => MovieModel.fromJson(json)).toList();
    } catch (e) {
      throw UnknownFailure();
    }
  }

  Future<List<MovieModel>> topRatedMovies() async {
    try {
      final response = await dio.get(endpoint: '/movie/top_rated', token: ApiConstants.token);

      final List results = response.data['results'];
      log("❌ topRatedMovies ❌$results");

      return results.map((json) => MovieModel.fromJson(json)).toList();
    } catch (e) {
      throw UnknownFailure();
    }
  }
}
