import 'package:freezed_annotation/freezed_annotation.dart';

part 'video.freezed.dart';
part 'video.g.dart';

@freezed
abstract class Video with _$Video {
  const factory Video({
    required String id,
    required String key,
    required String name,
    required String type,
    required String site,
  }) = _Video;

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
}
