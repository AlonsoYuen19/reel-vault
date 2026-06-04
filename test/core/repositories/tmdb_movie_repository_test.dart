import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reel_vault/core/domain/entities/movie.dart';
import 'package:reel_vault/core/network/network.dart';
import 'package:reel_vault/core/repositories/tmdb_movie_repository.dart';

class MockTmdbRemoteDataSource extends Mock implements TmdbRemoteDataSource {}

void main() {
  late MockTmdbRemoteDataSource mockDataSource;
  late TmdbMovieRepository repository;

  setUp(() {
    mockDataSource = MockTmdbRemoteDataSource();
    repository = TmdbMovieRepository(remoteDataSource: mockDataSource);
  });

  group('getPopularMovies', () {
    const tMovieDto = MovieDto(
      id: 123,
      title: 'Test Movie',
    );

    const tResponseDto = PopularMoviesResponseDto(
      page: 1,
      results: [tMovieDto],
      totalPages: 1,
      totalResults: 1,
    );

    test(
      'Given the data source returns a successful response, '
      'when getPopularMovies is called, '
      'then it should return the mapped list of movies',
      () async {
        // given
        when(() => mockDataSource.getPopularMovies()).thenAnswer((_) async => tResponseDto);

        // when
        final result = await repository.getPopularMovies();

        // then
        expect(result, isA<List<Movie>>());
        expect(result.length, 1);
        expect(result.first.title, 'Test Movie');
        verify(() => mockDataSource.getPopularMovies()).called(1);
      },
    );

    test(
      'Given the data source throws a ServerException, '
      'when getPopularMovies is called, '
      'then it should throw a ServerFailure',
      () async {
        // given
        when(() => mockDataSource.getPopularMovies()).thenThrow(
          const ServerException(message: 'Server error', statusCode: 500),
        );

        // when / then
        expect(
          () => repository.getPopularMovies(),
          throwsA(isA<ServerFailure>()),
        );
      },
    );
  });
}
