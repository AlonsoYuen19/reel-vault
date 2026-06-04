import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reel_vault/core/network/datasources/tmdb_remote_data_source.dart';
import 'package:reel_vault/core/network/exceptions/api_exception.dart';
import 'package:reel_vault/core/network/models/popular_movies_response_dto.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late TmdbRemoteDataSource dataSource;

  // setUpAll se ejecuta UNA sola vez antes de correr todas las pruebas de este archivo.
  // Es ideal para configuraciones de configuración global, como registrar fallbacks de mocktail.
  setUpAll(() {
    registerFallbackValue(RequestOptions());
  });

  // setUp se ejecuta antes de CADA test individual.
  // Es ideal para inicializar o resetear variables y mocks, garantizando un estado limpio para cada test.
  setUp(() {
    mockDio = MockDio();
    dataSource = TmdbRemoteDataSource(dio: mockDio);
  });
  group('getPopularMovies', () {
    final tSuccessResponseData = {
      'page': 1,
      'results': <dynamic>[],
      'total_pages': 10,
      'total_results': 200,
    };

    test(
      'Given a successful response from the API, '
      'when getPopularMovies is called, '
      'then it should return PopularMoviesResponseDto',
      () async {
        // given
        when(
          () => mockDio.get<Map<String, dynamic>>(
            any(),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer(
          (_) async => Response(
            data: tSuccessResponseData,
            statusCode: 200,
            requestOptions: RequestOptions(path: '/movie/popular'),
          ),
        );

        // when
        final result = await dataSource.getPopularMovies();

        // then
        expect(result, isA<PopularMoviesResponseDto>());
        expect(result.page, 1);
        verify(
          () => mockDio.get<Map<String, dynamic>>(
            any(),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).called(1);
      },
    );

    test(
      'Given a connection error, '
      'when getPopularMovies is called, '
      'then it should throw a NetworkException',
      () async {
        // given
        when(
          () => mockDio.get<Map<String, dynamic>>(
            any(),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/movie/popular'),
            type: DioExceptionType.connectionError,
          ),
        );

        // when / then
        expect(
          () => dataSource.getPopularMovies(),
          throwsA(isA<NetworkException>()),
        );
      },
    );
    test(
      'Given a receive timeout, '
      'when getPopularMovies is called, '
      'then it should throw a TimeoutException',
      () async {
        // given
        when(
          () => mockDio.get<Map<String, dynamic>>(
            any(),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/movie/popular'),
            type: DioExceptionType.receiveTimeout,
          ),
        );

        // when / then
        expect(
          () => dataSource.getPopularMovies(),
          throwsA(isA<TimeoutException>()),
        );
      },
    );
    test(
      'Given a bad response from the server, '
      'when getPopularMovies is called, '
      'then it should throw a ServerException',
      () async {
        // given
        when(
          () => mockDio.get<Map<String, dynamic>>(
            any(),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/movie/popular'),
            type: DioExceptionType.badResponse,
            response: Response(
              statusCode: 500,
              data: {'message': 'Internal Server Error'},
              requestOptions: RequestOptions(path: '/movie/popular'),
            ),
          ),
        );

        // when / then
        expect(
          () => dataSource.getPopularMovies(),
          throwsA(isA<ServerException>()),
        );
      },
    );
  });
}
