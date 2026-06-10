import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
abstract class Movie with _$Movie {
  const factory Movie({
    required int id,
    required String title,
    String? overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'release_date', fromJson: _parseReleaseDate) DateTime? releaseDate,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}

DateTime? _parseReleaseDate(String? date) {
  if (date == null || date.isEmpty) return null;
  return DateTime.tryParse(date);
}
