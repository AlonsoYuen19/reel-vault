import 'package:reel_vault/features/anime/data/datasources/anime_remote_data_source.dart';
import 'package:reel_vault/features/anime/data/models/anime.dart';

class AnimeRepository {
  AnimeRepository({AnimeRemoteDataSource? remoteDataSource}) : _remoteDataSource = remoteDataSource ?? AnimeRemoteDataSource();

  final AnimeRemoteDataSource _remoteDataSource;

  Future<List<Anime>> searchAnime(String query, {int page = 1}) async {
    return _remoteDataSource.searchAnime(query, page: page);
  }
}
