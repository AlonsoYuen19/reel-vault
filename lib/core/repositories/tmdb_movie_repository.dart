import 'package:reel_vault/core/domain/entities/movie.dart';
import 'package:reel_vault/core/network/network.dart';
import 'package:reel_vault/core/repositories/movie_repository.dart';

class TmdbMovieRepository implements MovieRepository {
  TmdbMovieRepository({TmdbRemoteDataSource? remoteDataSource}) : _remoteDataSource = remoteDataSource ?? TmdbRemoteDataSource();
  final TmdbRemoteDataSource _remoteDataSource;

  @override
  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    try {
      final response = await _remoteDataSource.getPopularMovies(page: page);
      return response.results.map(MovieMapper.fromDto).toList();
    } on AppException catch (e) {
      throw ExceptionMapper.toFailure(e);
    }
  }
}
