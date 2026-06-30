import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reel_vault/features/home/data/models/movie.dart';

part 'search_state.freezed.dart';
@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    required String query,
    required AsyncValue<List<Movie>> results,
    required List<String> searchHistory,
    required AsyncValue<String?> aiResponse,
    required List<Movie> aiRecommendations,
    @Default(false) bool isSearchingAI,
  }) = _SearchState;
}