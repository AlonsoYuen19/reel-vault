import 'package:dio/dio.dart';
import 'package:reel_vault/core/network/clients/dio_client.dart';
import 'package:reel_vault/core/network/exceptions/api_exception.dart';
import 'package:reel_vault/features/home/data/models/movie.dart';
import 'package:reel_vault/features/movie_detail/data/models/cast.dart';
import 'package:reel_vault/features/movie_detail/data/models/video.dart';

class MovieDetailRemoteDataSource {
  MovieDetailRemoteDataSource({Dio? dio}) : _dio = dio ?? DioClient.dio;

  final Dio _dio;

  Future<Movie> getMovieDetails(int movieId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/movie/$movieId');
      final data = response.data ?? <String, dynamic>{};
      return Movie.fromJson(data);
    } on DioException catch (e) {
      throw AppException.fromDioException(e);
    } catch (e) {
      throw UnexpectedException(message: e.toString());
    }
  }

  Future<List<Cast>> getMovieCredits(int movieId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/movie/$movieId/credits');
      final data = response.data ?? <String, dynamic>{};
      final castJson = data['cast'] as List<dynamic>? ?? [];
      return castJson.map((item) => Cast.fromJson(item as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw AppException.fromDioException(e);
    } catch (e) {
      throw UnexpectedException(message: e.toString());
    }
  }

  Future<List<Video>> getMovieVideos(int movieId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/movie/$movieId/videos');
      final data = response.data ?? <String, dynamic>{};
      final videosJson = data['results'] as List<dynamic>? ?? [];
      return videosJson.map((item) => Video.fromJson(item as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw AppException.fromDioException(e);
    } catch (e) {
      throw UnexpectedException(message: e.toString());
    }
  }

  Future<List<Movie>> getMovieRecommendations(int movieId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/movie/$movieId/recommendations');
      final data = response.data ?? <String, dynamic>{};
      final recommendationsJson = data['results'] as List<dynamic>? ?? [];
      return recommendationsJson.map((item) => Movie.fromJson(item as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw AppException.fromDioException(e);
    } catch (e) {
      throw UnexpectedException(message: e.toString());
    }
  }
}
