import 'package:reel_vault/core/network/network.dart';
import 'package:reel_vault/features/home/data/mappers/movie_mapper.dart';
import 'package:reel_vault/features/home/data/models/movie.dart';

class HomeRepository {
  HomeRepository({TmdbRemoteDataSource? dataSource})
      : _dataSource = dataSource ?? TmdbRemoteDataSource();

  final TmdbRemoteDataSource _dataSource;

  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    try {
      final response = await _dataSource.getPopularMovies(page: page);
      return response.results.map(MovieMapper.fromDto).toList();
    } on AppException catch (e) {
      throw Exception('Error cargando películas populares: ${e.message}');
    } catch (e) {
      throw Exception('Error inesperado: $e');
    }
  }
}
