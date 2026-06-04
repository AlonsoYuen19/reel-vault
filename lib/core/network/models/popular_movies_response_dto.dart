import 'package:json_annotation/json_annotation.dart';
import 'package:reel_vault/core/network/models/movie_dto.dart';
part 'popular_movies_response_dto.g.dart';

@JsonSerializable()
class PopularMoviesResponseDto {
  const PopularMoviesResponseDto({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PopularMoviesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesResponseDtoFromJson(json);
  final int page;

  final List<MovieDto> results;

  @JsonKey(name: 'total_pages')
  final int totalPages;

  @JsonKey(name: 'total_results')
  final int totalResults;

  Map<String, dynamic> toJson() => _$PopularMoviesResponseDtoToJson(this);
}
