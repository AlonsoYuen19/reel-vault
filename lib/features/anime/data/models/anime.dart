import 'package:freezed_annotation/freezed_annotation.dart';
part 'anime.freezed.dart';

@freezed
abstract class Anime with _$Anime {
  const factory Anime({
    required int id,
    required String titleRomaji,
    String? titleEnglish,
    String? coverImageLarge,
    String? bannerImage,
    int? averageScore,
    String? description,
    List<String>? genres,
  }) = _Anime;

  factory Anime.fromJson(Map<String, dynamic> json) {
    final title = json['title'] as Map<String, dynamic>?;
    final cover = json['coverImage'] as Map<String, dynamic>?;
    return Anime(
      id: json['id'] as int,
      titleRomaji: (title?['romaji'] as String?) ?? 'Sin título',
      titleEnglish: title?['english'] as String?,
      coverImageLarge: cover?['large'] as String?,
      bannerImage: json['bannerImage'] as String?,
      averageScore: json['averageScore'] as int?,
      description: json['description'] as String?,
      genres: (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
  }
}
