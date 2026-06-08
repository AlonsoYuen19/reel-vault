import 'dart:async';

import 'package:reel_vault/features/home/data/models/movie.dart';
import 'package:reel_vault/features/home/data/repositories/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

@riverpod
HomeRepository homeRepository(Ref ref) {
  return HomeRepository();
}

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  FutureOr<List<Movie>> build() async {
    final repo = ref.watch(homeRepositoryProvider);
    return repo.getPopularMovies();
  }

  Future<void> loadPopularMovies({int page = 1}) async {
    state = await AsyncValue.guard(() async {
      final repo = ref.read(homeRepositoryProvider);
      final newMovies = await repo.getPopularMovies(page: page);
      final currentMovies = state.value ?? [];
      return page == 1 ? newMovies : [...currentMovies, ...newMovies];
    });
  }
}
