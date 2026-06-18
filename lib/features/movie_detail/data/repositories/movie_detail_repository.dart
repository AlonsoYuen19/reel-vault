import 'package:reel_vault/features/home/data/models/movie.dart';
import 'package:reel_vault/features/movie_detail/data/datasources/movie_detail_remote_data_source.dart';
import 'package:reel_vault/features/movie_detail/data/models/cast.dart';
import 'package:reel_vault/features/movie_detail/data/models/video.dart';

class MovieDetailRepository {
  MovieDetailRepository({MovieDetailRemoteDataSource? remoteDataSource}) : _remoteDataSource = remoteDataSource ?? MovieDetailRemoteDataSource();

  final MovieDetailRemoteDataSource _remoteDataSource;

  Future<Movie> getMovieDetails(int movieId) async {
    return _remoteDataSource.getMovieDetails(movieId);
  }

  Future<List<Cast>> getMovieCredits(int movieId) async {
    return _remoteDataSource.getMovieCredits(movieId);
  }

  Future<List<Video>> getMovieVideos(int movieId) async {
    return _remoteDataSource.getMovieVideos(movieId);
  }

  Future<List<Movie>> getMovieRecommendations(int movieId) async {
    return _remoteDataSource.getMovieRecommendations(movieId);
  }
}
