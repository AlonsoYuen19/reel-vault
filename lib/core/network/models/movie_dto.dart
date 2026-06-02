import 'package:json_annotation/json_annotation.dart';

part 'movie_dto.g.dart';

@JsonSerializable()
class MovieDto {

  const MovieDto({
    required this.id,
    required this.title,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.voteAverage,
    this.voteCount,
    this.releaseDate,
    this.genreIds,
  });

  factory MovieDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDtoFromJson(json);
  final int id;
  final String title;

  @JsonKey(name: 'original_title')
  final String? originalTitle;

  final String? overview;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @JsonKey(name: 'vote_count')
  final int? voteCount;

  @JsonKey(name: 'release_date')
  final String? releaseDate;

  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;

  Map<String, dynamic> toJson() => _$MovieDtoToJson(this);
}
