import 'package:dio/dio.dart';
import 'package:reel_vault/core/network/clients/dio_client.dart';
import 'package:reel_vault/core/network/exceptions/api_exception.dart';

import 'package:reel_vault/features/home/data/models/movie.dart';

class SearchRemoteDataSource {
  SearchRemoteDataSource({Dio? dio}) : _dio = dio ?? DioClient.dio;
  final Dio _dio;
  Future<List<Movie>> searchMovies(String query, {int page = 1}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/search/movie',
        queryParameters: {
          'query': query,
          'page': page,
        },
      );
      final data = response.data ?? <String, dynamic>{};
      final results = data['results'] as List<dynamic>? ?? [];
      return results.map((item) => Movie.fromJson(item as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw AppException.fromDioException(e);
    } catch (e) {
      throw UnexpectedException(message: e.toString());
    }
  }
}
