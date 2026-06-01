import 'package:dio/dio.dart';
import 'package:reel_vault/core/network/dio_client.dart';
import 'package:reel_vault/core/network/network_constants.dart';

class TmdbRemoteDataSource {

  TmdbRemoteDataSource({Dio? dio}) : _dio = dio ?? DioClient.dio;
  final Dio _dio;
  
  Future<Map<String, dynamic>> getPopularMovies({int page = 1}) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/movie/popular',
      queryParameters: {
        'page': page,
        'api_key': NetworkConstants.apiKey,
      },
    );

    return response.data ?? {};
  }
}
