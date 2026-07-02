// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Anime {

 int get id; String get titleRomaji; String? get titleEnglish; String? get coverImageLarge; String? get bannerImage; int? get averageScore; String? get description; List<String>? get genres;
/// Create a copy of Anime
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimeCopyWith<Anime> get copyWith => _$AnimeCopyWithImpl<Anime>(this as Anime, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Anime&&(identical(other.id, id) || other.id == id)&&(identical(other.titleRomaji, titleRomaji) || other.titleRomaji == titleRomaji)&&(identical(other.titleEnglish, titleEnglish) || other.titleEnglish == titleEnglish)&&(identical(other.coverImageLarge, coverImageLarge) || other.coverImageLarge == coverImageLarge)&&(identical(other.bannerImage, bannerImage) || other.bannerImage == bannerImage)&&(identical(other.averageScore, averageScore) || other.averageScore == averageScore)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.genres, genres));
}


@override
int get hashCode => Object.hash(runtimeType,id,titleRomaji,titleEnglish,coverImageLarge,bannerImage,averageScore,description,const DeepCollectionEquality().hash(genres));

@override
String toString() {
  return 'Anime(id: $id, titleRomaji: $titleRomaji, titleEnglish: $titleEnglish, coverImageLarge: $coverImageLarge, bannerImage: $bannerImage, averageScore: $averageScore, description: $description, genres: $genres)';
}


}

/// @nodoc
abstract mixin class $AnimeCopyWith<$Res>  {
  factory $AnimeCopyWith(Anime value, $Res Function(Anime) _then) = _$AnimeCopyWithImpl;
@useResult
$Res call({
 int id, String titleRomaji, String? titleEnglish, String? coverImageLarge, String? bannerImage, int? averageScore, String? description, List<String>? genres
});




}
/// @nodoc
class _$AnimeCopyWithImpl<$Res>
    implements $AnimeCopyWith<$Res> {
  _$AnimeCopyWithImpl(this._self, this._then);

  final Anime _self;
  final $Res Function(Anime) _then;

/// Create a copy of Anime
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? titleRomaji = null,Object? titleEnglish = freezed,Object? coverImageLarge = freezed,Object? bannerImage = freezed,Object? averageScore = freezed,Object? description = freezed,Object? genres = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,titleRomaji: null == titleRomaji ? _self.titleRomaji : titleRomaji // ignore: cast_nullable_to_non_nullable
as String,titleEnglish: freezed == titleEnglish ? _self.titleEnglish : titleEnglish // ignore: cast_nullable_to_non_nullable
as String?,coverImageLarge: freezed == coverImageLarge ? _self.coverImageLarge : coverImageLarge // ignore: cast_nullable_to_non_nullable
as String?,bannerImage: freezed == bannerImage ? _self.bannerImage : bannerImage // ignore: cast_nullable_to_non_nullable
as String?,averageScore: freezed == averageScore ? _self.averageScore : averageScore // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Anime].
extension AnimePatterns on Anime {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Anime value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Anime() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Anime value)  $default,){
final _that = this;
switch (_that) {
case _Anime():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Anime value)?  $default,){
final _that = this;
switch (_that) {
case _Anime() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String titleRomaji,  String? titleEnglish,  String? coverImageLarge,  String? bannerImage,  int? averageScore,  String? description,  List<String>? genres)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Anime() when $default != null:
return $default(_that.id,_that.titleRomaji,_that.titleEnglish,_that.coverImageLarge,_that.bannerImage,_that.averageScore,_that.description,_that.genres);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String titleRomaji,  String? titleEnglish,  String? coverImageLarge,  String? bannerImage,  int? averageScore,  String? description,  List<String>? genres)  $default,) {final _that = this;
switch (_that) {
case _Anime():
return $default(_that.id,_that.titleRomaji,_that.titleEnglish,_that.coverImageLarge,_that.bannerImage,_that.averageScore,_that.description,_that.genres);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String titleRomaji,  String? titleEnglish,  String? coverImageLarge,  String? bannerImage,  int? averageScore,  String? description,  List<String>? genres)?  $default,) {final _that = this;
switch (_that) {
case _Anime() when $default != null:
return $default(_that.id,_that.titleRomaji,_that.titleEnglish,_that.coverImageLarge,_that.bannerImage,_that.averageScore,_that.description,_that.genres);case _:
  return null;

}
}

}

/// @nodoc


class _Anime implements Anime {
  const _Anime({required this.id, required this.titleRomaji, this.titleEnglish, this.coverImageLarge, this.bannerImage, this.averageScore, this.description, final  List<String>? genres}): _genres = genres;
  

@override final  int id;
@override final  String titleRomaji;
@override final  String? titleEnglish;
@override final  String? coverImageLarge;
@override final  String? bannerImage;
@override final  int? averageScore;
@override final  String? description;
 final  List<String>? _genres;
@override List<String>? get genres {
  final value = _genres;
  if (value == null) return null;
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Anime
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnimeCopyWith<_Anime> get copyWith => __$AnimeCopyWithImpl<_Anime>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Anime&&(identical(other.id, id) || other.id == id)&&(identical(other.titleRomaji, titleRomaji) || other.titleRomaji == titleRomaji)&&(identical(other.titleEnglish, titleEnglish) || other.titleEnglish == titleEnglish)&&(identical(other.coverImageLarge, coverImageLarge) || other.coverImageLarge == coverImageLarge)&&(identical(other.bannerImage, bannerImage) || other.bannerImage == bannerImage)&&(identical(other.averageScore, averageScore) || other.averageScore == averageScore)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._genres, _genres));
}


@override
int get hashCode => Object.hash(runtimeType,id,titleRomaji,titleEnglish,coverImageLarge,bannerImage,averageScore,description,const DeepCollectionEquality().hash(_genres));

@override
String toString() {
  return 'Anime(id: $id, titleRomaji: $titleRomaji, titleEnglish: $titleEnglish, coverImageLarge: $coverImageLarge, bannerImage: $bannerImage, averageScore: $averageScore, description: $description, genres: $genres)';
}


}

/// @nodoc
abstract mixin class _$AnimeCopyWith<$Res> implements $AnimeCopyWith<$Res> {
  factory _$AnimeCopyWith(_Anime value, $Res Function(_Anime) _then) = __$AnimeCopyWithImpl;
@override @useResult
$Res call({
 int id, String titleRomaji, String? titleEnglish, String? coverImageLarge, String? bannerImage, int? averageScore, String? description, List<String>? genres
});




}
/// @nodoc
class __$AnimeCopyWithImpl<$Res>
    implements _$AnimeCopyWith<$Res> {
  __$AnimeCopyWithImpl(this._self, this._then);

  final _Anime _self;
  final $Res Function(_Anime) _then;

/// Create a copy of Anime
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? titleRomaji = null,Object? titleEnglish = freezed,Object? coverImageLarge = freezed,Object? bannerImage = freezed,Object? averageScore = freezed,Object? description = freezed,Object? genres = freezed,}) {
  return _then(_Anime(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,titleRomaji: null == titleRomaji ? _self.titleRomaji : titleRomaji // ignore: cast_nullable_to_non_nullable
as String,titleEnglish: freezed == titleEnglish ? _self.titleEnglish : titleEnglish // ignore: cast_nullable_to_non_nullable
as String?,coverImageLarge: freezed == coverImageLarge ? _self.coverImageLarge : coverImageLarge // ignore: cast_nullable_to_non_nullable
as String?,bannerImage: freezed == bannerImage ? _self.bannerImage : bannerImage // ignore: cast_nullable_to_non_nullable
as String?,averageScore: freezed == averageScore ? _self.averageScore : averageScore // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,genres: freezed == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
