import 'dart:developer';

import 'package:court_flix/core/repository/api_constants.dart';
import 'package:court_flix/core/repository/dio_client.dart';
import 'package:court_flix/feature/search/data/model/comingsoon_model.dart';
import 'package:court_flix/feature/search/data/model/search_model.dart';

class topSearchDatasource {
  final dioClient dio;

  topSearchDatasource({required this.dio});

  Future<List<MovieSearchModel>> getTopseaches(final String query) async {
    try {
      final response = await dio.getwithParms(
        endpoint: '/search/movie',
        token: ApiConstants.token,
        query: query,
      );

      final List results = response.data['results'];

      return results.map((json) => MovieSearchModel.fromJson(json)).toList();
    } catch (e) {
      log("❌ getTopseaches ❌ $e");
      rethrow;
    }
  }

  Future<List<ComingsoonModel>> getComingSooons() async {
    final response = await dio.get(endpoint: '/movie/upcoming', token: ApiConstants.token);
    try {
      final List results = response.data['results'];

      return results.map((json) => ComingsoonModel.fromJson(json)).toList();
    } catch (e) {
      log("❌ getComingSooons ❌ $e");
      rethrow;
    }
  }
}
