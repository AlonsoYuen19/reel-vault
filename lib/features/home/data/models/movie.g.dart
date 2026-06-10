// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Movie _$MovieFromJson(Map<String, dynamic> json) => _Movie(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  overview: json['overview'] as String?,
  posterPath: json['poster_path'] as String?,
  voteAverage: (json['vote_average'] as num?)?.toDouble(),
  releaseDate: _parseReleaseDate(json['release_date'] as String?),
);

Map<String, dynamic> _$MovieToJson(_Movie instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'overview': instance.overview,
  'poster_path': instance.posterPath,
  'vote_average': instance.voteAverage,
  'release_date': instance.releaseDate?.toIso8601String(),
};
