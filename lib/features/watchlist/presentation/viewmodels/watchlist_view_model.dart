import 'dart:async';
import 'package:reel_vault/features/home/data/models/movie.dart';
import 'package:reel_vault/features/watchlist/data/repositories/watchlist_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'watchlist_view_model.g.dart';

@riverpod
WatchlistRepository watchlistRepository(Ref ref) {
  return WatchlistRepository();
}

@riverpod
class WatchlistViewModel extends _$WatchlistViewModel {
  @override
  FutureOr<List<Movie>> build() {
    final repo = ref.read(watchlistRepositoryProvider);
    return repo.getWatchlist();
  }

  Future<void> toggleWatchlist(Movie movie) async {
    final repo = ref.read(watchlistRepositoryProvider);
    final isFav = repo.isInWatchlist(movie.id);

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      if (isFav) {
        await repo.removeFromWatchlist(movie.id);
      } else {
        await repo.saveToWatchlist(movie);
      }
      return repo.getWatchlist();
    });
  }

  bool isFavorite(int movieId) {
    final repo = ref.read(watchlistRepositoryProvider);
    return repo.isInWatchlist(movieId);
  }
}
