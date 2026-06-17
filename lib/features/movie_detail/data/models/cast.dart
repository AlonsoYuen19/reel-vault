import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast.freezed.dart';
part 'cast.g.dart';

@freezed
abstract class Cast with _$Cast {
  const factory Cast({
    required int id,
    required String name,
    @JsonKey(name: 'profile_path') String? profilePath,
    @JsonKey(name: 'character') String? character,
  }) = _Cast;

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
}
