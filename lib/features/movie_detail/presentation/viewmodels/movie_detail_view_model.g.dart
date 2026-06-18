// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(movieDetailRepository)
final movieDetailRepositoryProvider = MovieDetailRepositoryProvider._();

final class MovieDetailRepositoryProvider
    extends
        $FunctionalProvider<
          MovieDetailRepository,
          MovieDetailRepository,
          MovieDetailRepository
        >
    with $Provider<MovieDetailRepository> {
  MovieDetailRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'movieDetailRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$movieDetailRepositoryHash();

  @$internal
  @override
  $ProviderElement<MovieDetailRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MovieDetailRepository create(Ref ref) {
    return movieDetailRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MovieDetailRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MovieDetailRepository>(value),
    );
  }
}

String _$movieDetailRepositoryHash() =>
    r'8b4d29f52136be6e193c50f51d06505f9757ffef';

@ProviderFor(MovieDetailViewModel)
final movieDetailViewModelProvider = MovieDetailViewModelFamily._();

final class MovieDetailViewModelProvider
    extends $NotifierProvider<MovieDetailViewModel, MovieDetailState> {
  MovieDetailViewModelProvider._({
    required MovieDetailViewModelFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'movieDetailViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$movieDetailViewModelHash();

  @override
  String toString() {
    return r'movieDetailViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MovieDetailViewModel create() => MovieDetailViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MovieDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MovieDetailState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MovieDetailViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$movieDetailViewModelHash() =>
    r'b4ab814191f3f331298bb9ae659ffa5b562f23d3';

final class MovieDetailViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          MovieDetailViewModel,
          MovieDetailState,
          MovieDetailState,
          MovieDetailState,
          int
        > {
  MovieDetailViewModelFamily._()
    : super(
        retry: null,
        name: r'movieDetailViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MovieDetailViewModelProvider call(int movieId) =>
      MovieDetailViewModelProvider._(argument: movieId, from: this);

  @override
  String toString() => r'movieDetailViewModelProvider';
}

abstract class _$MovieDetailViewModel extends $Notifier<MovieDetailState> {
  late final _$args = ref.$arg as int;
  int get movieId => _$args;

  MovieDetailState build(int movieId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<MovieDetailState, MovieDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MovieDetailState, MovieDetailState>,
              MovieDetailState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
