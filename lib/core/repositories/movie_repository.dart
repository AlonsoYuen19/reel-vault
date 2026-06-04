import 'package:reel_vault/core/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getPopularMovies({int page = 1});
}
