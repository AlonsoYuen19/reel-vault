import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reel_vault/features/home/data/models/movie.dart';
import 'package:reel_vault/features/movie_detail/data/models/cast.dart';

part 'movie_detail_state.freezed.dart';

@freezed
abstract class MovieDetailState with _$MovieDetailState {
  const factory MovieDetailState({
    required AsyncValue<Movie> movie,
    required AsyncValue<List<Cast>> cast,
    required AsyncValue<List<Movie>> recommendations,
    String? trailerKey,
  }) = _MovieDetailState;
}