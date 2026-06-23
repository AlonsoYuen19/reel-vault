import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reel_vault/features/home/data/models/movie.dart';
import 'package:reel_vault/features/watchlist/data/datasources/watchlist_local_data_source.dart';
import 'package:reel_vault/features/watchlist/data/repositories/watchlist_repository.dart';

class MockWatchlistLocalDataSource extends Mock implements WatchlistLocalDataSource {}

void main() {
  late MockWatchlistLocalDataSource mockLocalDataSource;
  late WatchlistRepository repository;

  final tMovie = Movie(
    id: 1,
    title: 'Test Movie',
    overview: 'This is a test movie',
    posterPath: '/path.jpg',
    backdropPath: '/back.jpg',
    releaseDate: DateTime(2023),
    voteAverage: 8.5,
  );

  setUp(() {
    mockLocalDataSource = MockWatchlistLocalDataSource();
    repository = WatchlistRepository(localDataSource: mockLocalDataSource);
  });

  group('getWatchlist', () {
    test('should return a list of movies from the datasource', () {
      // given
      final tMoviesList = [tMovie];
      when(() => mockLocalDataSource.getWatchlist()).thenReturn(tMoviesList);

      // when
      final result = repository.getWatchlist();

      // then
      expect(result, tMoviesList);
      verify(() => mockLocalDataSource.getWatchlist()).called(1);
    });
  });

  group('saveToWatchlist', () {
    test('should call saveToWatchlist on the datasource', () async {
      // given
      when(() => mockLocalDataSource.saveToWatchlist(tMovie)).thenAnswer((_) async {});

      // when
      await repository.saveToWatchlist(tMovie);

      // then
      verify(() => mockLocalDataSource.saveToWatchlist(tMovie)).called(1);
    });
  });

  group('removeFromWatchlist', () {
    test('should call removeFromWatchlist on the datasource', () async {
      // given
      const tMovieId = 1;
      when(() => mockLocalDataSource.removeFromWatchlist(tMovieId)).thenAnswer((_) async {});

      // when
      await repository.removeFromWatchlist(tMovieId);

      // then
      verify(() => mockLocalDataSource.removeFromWatchlist(tMovieId)).called(1);
    });
  });

  group('isInWatchlist', () {
    test('should return true when movie is in watchlist', () {
      // given
      const tMovieId = 1;
      when(() => mockLocalDataSource.isInWatchlist(tMovieId)).thenReturn(true);

      // when
      final result = repository.isInWatchlist(tMovieId);

      // then
      expect(result, true);
      verify(() => mockLocalDataSource.isInWatchlist(tMovieId)).called(1);
    });

    test('should return false when movie is not in watchlist', () {
      // given
      const tMovieId = 1;
      when(() => mockLocalDataSource.isInWatchlist(tMovieId)).thenReturn(false);

      // when
      final result = repository.isInWatchlist(tMovieId);

      // then
      expect(result, false);
      verify(() => mockLocalDataSource.isInWatchlist(tMovieId)).called(1);
    });
  });
}
