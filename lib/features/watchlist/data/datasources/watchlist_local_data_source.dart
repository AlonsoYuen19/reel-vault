import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:reel_vault/features/home/data/models/movie.dart';

class WatchlistLocalDataSource {
  WatchlistLocalDataSource();

  Box<String> get _box => Hive.box<String>('watchlist_movies');

  List<Movie> getWatchlist() {
    final list = <Movie>[];
    for (final rawJson in _box.values) {
      try {
        final decoded = json.decode(rawJson) as Map<String, dynamic>;
        list.add(Movie.fromJson(decoded));
      } on Object catch (_) {
        // Ignorar películas corruptas/inválidas en la caché local
      }
    }
    return list;
  }

  Future<void> saveToWatchlist(Movie movie) async {
    final rawJson = json.encode(movie.toJson());
    await _box.put(movie.id.toString(), rawJson);
  }

  Future<void> removeFromWatchlist(int movieId) async {
    await _box.delete(movieId.toString());
  }

  bool isInWatchlist(int movieId) {
    return _box.containsKey(movieId.toString());
  }
}
