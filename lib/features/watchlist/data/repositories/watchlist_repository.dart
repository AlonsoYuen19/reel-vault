import 'package:reel_vault/features/home/data/models/movie.dart';
import 'package:reel_vault/features/watchlist/data/datasources/watchlist_local_data_source.dart';

class WatchlistRepository {
  WatchlistRepository({WatchlistLocalDataSource? localDataSource}) : _localDataSource = localDataSource ?? WatchlistLocalDataSource();

  final WatchlistLocalDataSource _localDataSource;

  List<Movie> getWatchlist() {
    return _localDataSource.getWatchlist();
  }

  Future<void> saveToWatchlist(Movie movie) async {
    await _localDataSource.saveToWatchlist(movie);
  }

  Future<void> removeFromWatchlist(int movieId) async {
    await _localDataSource.removeFromWatchlist(movieId);
  }

  bool isInWatchlist(int movieId) {
    return _localDataSource.isInWatchlist(movieId);
  }
}
