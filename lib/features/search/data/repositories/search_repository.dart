import 'package:reel_vault/features/home/data/models/movie.dart';
import 'package:reel_vault/features/search/data/datasources/search_remote_data_source.dart';

class SearchRepository {
  SearchRepository({SearchRemoteDataSource? remoteDataSource}) : _remoteDataSource = remoteDataSource ?? SearchRemoteDataSource();
  final SearchRemoteDataSource _remoteDataSource;

  Future<List<Movie>> searchMovies(String query, {int page = 1}) async {
    return _remoteDataSource.searchMovies(query, page: page);
  }
}
