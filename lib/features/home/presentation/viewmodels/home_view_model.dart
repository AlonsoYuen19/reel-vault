import 'dart:async';

import 'package:reel_vault/features/home/data/repositories/home_repository.dart';
import 'package:reel_vault/features/home/presentation/viewmodels/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

@riverpod
HomeRepository homeRepository(Ref ref) {
  return HomeRepository();
}

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  HomeState build() {
    unawaited(_loadInitial());
    return const HomeState(movies: AsyncValue.loading());
  }

  Future<void> _loadInitial() async {
    final result = await AsyncValue.guard(
      () => ref.read(homeRepositoryProvider).getPopularMovies(),
    );
    state = state.copyWith(
      movies: result,
      currentPage: 1,
    );
  }

  Future<void> refresh() async {
    final result = await AsyncValue.guard(
      () => ref.read(homeRepositoryProvider).getPopularMovies(),
    );
    state = state.copyWith(
      movies: result,
      currentPage: 1,
    );
  }

  Future<void> loadNextPage() async {
    if (state.isFetchingMore || state.movies.isLoading) return;

    state = state.copyWith(isFetchingMore: true);

    final nextPage = state.currentPage + 1;
    final result = await AsyncValue.guard(
      () => ref.read(homeRepositoryProvider).getPopularMovies(page: nextPage),
    );

    result.when(
      data: (newMovies) {
        final currentMovies = state.movies.value ?? [];
        state = state.copyWith(
          movies: AsyncValue.data([...currentMovies, ...newMovies]),
          currentPage: nextPage,
          isFetchingMore: false,
        );
      },
      error: (error, stackTrace) {
        state = state.copyWith(
          isFetchingMore: false,
        );
      },
      loading: () {},
    );
  }

  void selectCategory(String category) {
    state = state.copyWith(selectedCategory: category);
  }
}
