import 'package:reel_vault/core/network/models/movie_dto.dart';
import 'package:reel_vault/features/home/data/models/movie.dart';

class MovieMapper {
  const MovieMapper._();

  static Movie fromDto(MovieDto dto) {
    return Movie(
      id: dto.id,
      title: dto.title,
      overview: dto.overview,
      posterPath: dto.posterPath,
      voteAverage: dto.voteAverage,
      releaseDate: _parseReleaseDate(dto.releaseDate),
    );
  }

  static DateTime? _parseReleaseDate(String? releaseDate) {
    if (releaseDate == null || releaseDate.isEmpty) {
      return null;
    }
    try {
      return DateTime.parse(releaseDate);
    } on FormatException {
      return null;
    }
  }
}