import 'package:freezed_annotation/freezed_annotation.dart';
part 'movie.freezed.dart';

@freezed
abstract class Movie with _$Movie {
  const factory Movie({
    required int id,
    required String title,
    String? overview,
    String? posterPath,
    double? voteAverage,
    DateTime? releaseDate,
  }) = _Movie;
}
