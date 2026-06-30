import 'package:dio/dio.dart';
import 'package:reel_vault/core/network/network.dart';
import 'package:reel_vault/features/home/data/models/popular_movies_response.dart';

class TmdbRemoteDataSource {
  TmdbRemoteDataSource({Dio? dio}) : _dio = dio ?? DioClient.dio;
  final Dio _dio;

  Future<PopularMoviesResponse> getPopularMovies({int page = 1}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/movie/popular',
        queryParameters: {'page': page},
      );
      final data = response.data ?? <String, dynamic>{};
      return PopularMoviesResponse.fromJson(data);
    } on DioException catch (error) {
      throw AppException.fromDioException(error);
    } catch (e) {
      throw UnexpectedException(message: e.toString());
    }
  }
}
