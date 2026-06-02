import 'package:dio/dio.dart';
import 'package:reel_vault/core/network/network.dart';

class TmdbRemoteDataSource {
  TmdbRemoteDataSource({Dio? dio}) : _dio = dio ?? DioClient.dio;
  final Dio _dio;

  Future<PopularMoviesResponseDto> getPopularMovies({int page = 1}) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/movie/popular',
      queryParameters: {'page': page},
    );
    final data = response.data ?? <String, dynamic>{};
    return PopularMoviesResponseDto.fromJson(data);
  }
}
