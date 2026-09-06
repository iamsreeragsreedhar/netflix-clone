import 'package:court_flix/core/repository/api_constants.dart';
import 'package:dio/dio.dart';

class dioClient {
  late Dio dio;

  dioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        headers: {
          'Authorization': 'Bearer ${ApiConstants.token}',
          'Content-Type': 'application/json',
        },
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        contentType: 'application/json',
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
  }

  Future<Response> get({required String endpoint, String? token}) async {
    try {
      final headers = <String, dynamic>{};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      final response = await dio.get(endpoint, options: Options(headers: headers));
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getwithParms({
    required String endpoint,
    String? token,
    required String query,
  }) async {
    try {
      final headers = <String, dynamic>{};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      final response = await dio.get(
        endpoint,
        queryParameters: {'query': query, 'include_adult': false, 'language': 'en-US', 'page': 1},

        options: Options(headers: headers),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
