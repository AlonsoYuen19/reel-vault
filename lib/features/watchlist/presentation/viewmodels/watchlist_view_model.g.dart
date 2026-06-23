// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(watchlistRepository)
final watchlistRepositoryProvider = WatchlistRepositoryProvider._();

final class WatchlistRepositoryProvider
    extends
        $FunctionalProvider<
          WatchlistRepository,
          WatchlistRepository,
          WatchlistRepository
        >
    with $Provider<WatchlistRepository> {
  WatchlistRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchlistRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchlistRepositoryHash();

  @$internal
  @override
  $ProviderElement<WatchlistRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WatchlistRepository create(Ref ref) {
    return watchlistRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WatchlistRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WatchlistRepository>(value),
    );
  }
}

String _$watchlistRepositoryHash() =>
    r'f5ccf7e047a9e1e060196e751484267f775cd59d';

@ProviderFor(WatchlistViewModel)
final watchlistViewModelProvider = WatchlistViewModelProvider._();

final class WatchlistViewModelProvider
    extends $AsyncNotifierProvider<WatchlistViewModel, List<Movie>> {
  WatchlistViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchlistViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchlistViewModelHash();

  @$internal
  @override
  WatchlistViewModel create() => WatchlistViewModel();
}

String _$watchlistViewModelHash() =>
    r'0fde13ab2870b7399e351fd4879e953e2c880dbc';

abstract class _$WatchlistViewModel extends $AsyncNotifier<List<Movie>> {
  FutureOr<List<Movie>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Movie>>, List<Movie>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Movie>>, List<Movie>>,
              AsyncValue<List<Movie>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
