import 'package:dio/dio.dart';
import 'package:reel_vault/core/network/network.dart';

class TmdbRemoteDataSource {
  TmdbRemoteDataSource({Dio? dio}) : _dio = dio ?? DioClient.dio;

  final Dio _dio;

  Future<Map<String, dynamic>> getPopularMovies({int page = 1}) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/movie/popular',
      queryParameters: {
        'page': page,
      },
    );

    return response.data ?? {};
  }
}
