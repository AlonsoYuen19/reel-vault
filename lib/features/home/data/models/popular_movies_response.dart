import 'package:json_annotation/json_annotation.dart';
import 'package:reel_vault/features/home/data/models/movie.dart';

part 'popular_movies_response.g.dart';

@JsonSerializable()
class PopularMoviesResponse {
  const PopularMoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PopularMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesResponseFromJson(json);

  final int page;
  final List<Movie> results;

  @JsonKey(name: 'total_pages')
  final int totalPages;

  @JsonKey(name: 'total_results')
  final int totalResults;

  Map<String, dynamic> toJson() => _$PopularMoviesResponseToJson(this);
}
