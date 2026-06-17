import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reel_vault/features/home/data/models/movie.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required AsyncValue<List<Movie>> movies,
    @Default(false) bool isFetchingMore,
    @Default(1) int currentPage,
    @Default('Todo') String selectedCategory,
  }) = _HomeState;
}
