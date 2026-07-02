import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:reel_vault/core/network/exceptions/api_exception.dart';
import 'package:reel_vault/features/anime/data/models/anime.dart';

class AnimeRemoteDataSource {
  AnimeRemoteDataSource({GraphQLClient? client})
    : _client =
          client ??
          GraphQLClient(
            link: HttpLink('https://graphql.anilist.co'),
            cache: GraphQLCache(),
          );
  final GraphQLClient _client;
  Future<List<Anime>> searchAnime(String query, {int page = 1, int perPage = 10}) async {
    const queryStr = r'''
      query ($search: String, $page: Int, $perPage: Int) {
        Page (page: $page, perPage: $perPage) {
          media (search: $search, type: ANIME) {
            id
            title {
              romaji
              english
            }
            coverImage {
              large
            }
            bannerImage
            averageScore
            description
            genres
          }
        }
      }
    ''';
    final options = QueryOptions(
      document: gql(queryStr),
      variables: <String, dynamic>{
        'search': query,
        'page': page,
        'perPage': perPage,
      },
    );
    try {
      final result = await _client.query(options);
      if (result.hasException) {
        throw UnexpectedException(
          message: result.exception?.graphqlErrors.map((e) => e.message).join(', ') ?? result.exception.toString(),
        );
      }
      final data = result.data ?? <String, dynamic>{};
      final pageData = data['Page'] as Map<String, dynamic>? ?? <String, dynamic>{};
      final media = pageData['media'] as List<dynamic>? ?? [];
      return media.map((item) => Anime.fromJson(item as Map<String, dynamic>)).toList();
    } catch (e) {
      if (e is AppException) rethrow;
      throw UnexpectedException(message: e.toString());
    }
  }
}
