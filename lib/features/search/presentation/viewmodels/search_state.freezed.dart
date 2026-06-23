// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchState {

 String get query; AsyncValue<List<Movie>> get results; List<String> get searchHistory; AsyncValue<String?> get aiResponse; List<Movie> get aiRecommendations; bool get isSearchingAI;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<SearchState> get copyWith => _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState&&(identical(other.query, query) || other.query == query)&&(identical(other.results, results) || other.results == results)&&const DeepCollectionEquality().equals(other.searchHistory, searchHistory)&&(identical(other.aiResponse, aiResponse) || other.aiResponse == aiResponse)&&const DeepCollectionEquality().equals(other.aiRecommendations, aiRecommendations)&&(identical(other.isSearchingAI, isSearchingAI) || other.isSearchingAI == isSearchingAI));
}


@override
int get hashCode => Object.hash(runtimeType,query,results,const DeepCollectionEquality().hash(searchHistory),aiResponse,const DeepCollectionEquality().hash(aiRecommendations),isSearchingAI);

@override
String toString() {
  return 'SearchState(query: $query, results: $results, searchHistory: $searchHistory, aiResponse: $aiResponse, aiRecommendations: $aiRecommendations, isSearchingAI: $isSearchingAI)';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res>  {
  factory $SearchStateCopyWith(SearchState value, $Res Function(SearchState) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 String query, AsyncValue<List<Movie>> results, List<String> searchHistory, AsyncValue<String?> aiResponse, List<Movie> aiRecommendations, bool isSearchingAI
});




}
/// @nodoc
class _$SearchStateCopyWithImpl<$Res>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? results = null,Object? searchHistory = null,Object? aiResponse = null,Object? aiRecommendations = null,Object? isSearchingAI = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<Movie>>,searchHistory: null == searchHistory ? _self.searchHistory : searchHistory // ignore: cast_nullable_to_non_nullable
as List<String>,aiResponse: null == aiResponse ? _self.aiResponse : aiResponse // ignore: cast_nullable_to_non_nullable
as AsyncValue<String?>,aiRecommendations: null == aiRecommendations ? _self.aiRecommendations : aiRecommendations // ignore: cast_nullable_to_non_nullable
as List<Movie>,isSearchingAI: null == isSearchingAI ? _self.isSearchingAI : isSearchingAI // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchState value)  $default,){
final _that = this;
switch (_that) {
case _SearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query,  AsyncValue<List<Movie>> results,  List<String> searchHistory,  AsyncValue<String?> aiResponse,  List<Movie> aiRecommendations,  bool isSearchingAI)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.query,_that.results,_that.searchHistory,_that.aiResponse,_that.aiRecommendations,_that.isSearchingAI);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query,  AsyncValue<List<Movie>> results,  List<String> searchHistory,  AsyncValue<String?> aiResponse,  List<Movie> aiRecommendations,  bool isSearchingAI)  $default,) {final _that = this;
switch (_that) {
case _SearchState():
return $default(_that.query,_that.results,_that.searchHistory,_that.aiResponse,_that.aiRecommendations,_that.isSearchingAI);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query,  AsyncValue<List<Movie>> results,  List<String> searchHistory,  AsyncValue<String?> aiResponse,  List<Movie> aiRecommendations,  bool isSearchingAI)?  $default,) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.query,_that.results,_that.searchHistory,_that.aiResponse,_that.aiRecommendations,_that.isSearchingAI);case _:
  return null;

}
}

}

/// @nodoc


class _SearchState implements SearchState {
  const _SearchState({required this.query, required this.results, required final  List<String> searchHistory, required this.aiResponse, required final  List<Movie> aiRecommendations, this.isSearchingAI = false}): _searchHistory = searchHistory,_aiRecommendations = aiRecommendations;
  

@override final  String query;
@override final  AsyncValue<List<Movie>> results;
 final  List<String> _searchHistory;
@override List<String> get searchHistory {
  if (_searchHistory is EqualUnmodifiableListView) return _searchHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchHistory);
}

@override final  AsyncValue<String?> aiResponse;
 final  List<Movie> _aiRecommendations;
@override List<Movie> get aiRecommendations {
  if (_aiRecommendations is EqualUnmodifiableListView) return _aiRecommendations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_aiRecommendations);
}

@override@JsonKey() final  bool isSearchingAI;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchStateCopyWith<_SearchState> get copyWith => __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchState&&(identical(other.query, query) || other.query == query)&&(identical(other.results, results) || other.results == results)&&const DeepCollectionEquality().equals(other._searchHistory, _searchHistory)&&(identical(other.aiResponse, aiResponse) || other.aiResponse == aiResponse)&&const DeepCollectionEquality().equals(other._aiRecommendations, _aiRecommendations)&&(identical(other.isSearchingAI, isSearchingAI) || other.isSearchingAI == isSearchingAI));
}


@override
int get hashCode => Object.hash(runtimeType,query,results,const DeepCollectionEquality().hash(_searchHistory),aiResponse,const DeepCollectionEquality().hash(_aiRecommendations),isSearchingAI);

@override
String toString() {
  return 'SearchState(query: $query, results: $results, searchHistory: $searchHistory, aiResponse: $aiResponse, aiRecommendations: $aiRecommendations, isSearchingAI: $isSearchingAI)';
}


}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(_SearchState value, $Res Function(_SearchState) _then) = __$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 String query, AsyncValue<List<Movie>> results, List<String> searchHistory, AsyncValue<String?> aiResponse, List<Movie> aiRecommendations, bool isSearchingAI
});




}
/// @nodoc
class __$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? results = null,Object? searchHistory = null,Object? aiResponse = null,Object? aiRecommendations = null,Object? isSearchingAI = null,}) {
  return _then(_SearchState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<Movie>>,searchHistory: null == searchHistory ? _self._searchHistory : searchHistory // ignore: cast_nullable_to_non_nullable
as List<String>,aiResponse: null == aiResponse ? _self.aiResponse : aiResponse // ignore: cast_nullable_to_non_nullable
as AsyncValue<String?>,aiRecommendations: null == aiRecommendations ? _self._aiRecommendations : aiRecommendations // ignore: cast_nullable_to_non_nullable
as List<Movie>,isSearchingAI: null == isSearchingAI ? _self.isSearchingAI : isSearchingAI // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
