import 'package:reel_vault/features/home/data/datasources/tmdb_remote_data_source.dart';
import 'package:reel_vault/features/home/data/models/movie.dart';

class HomeRepository {
  HomeRepository({TmdbRemoteDataSource? dataSource}) : _dataSource = dataSource ?? TmdbRemoteDataSource();

  final TmdbRemoteDataSource _dataSource;

  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    final response = await _dataSource.getPopularMovies(page: page);
    return response.results;
  }
}
