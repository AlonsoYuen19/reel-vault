import 'dart:async';

import 'package:reel_vault/features/home/data/models/movie.dart';
import 'package:reel_vault/features/movie_detail/data/models/cast.dart';
import 'package:reel_vault/features/movie_detail/data/models/video.dart';
import 'package:reel_vault/features/movie_detail/data/repositories/movie_detail_repository.dart';
import 'package:reel_vault/features/movie_detail/presentation/viewmodels/movie_detail_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movie_detail_view_model.g.dart';

@riverpod
MovieDetailRepository movieDetailRepository(Ref ref) {
  return MovieDetailRepository();
}

@riverpod
class MovieDetailViewModel extends _$MovieDetailViewModel {
  @override
  MovieDetailState build(int movieId) {
    unawaited(_loadDetails(movieId));
    return const MovieDetailState(movie: AsyncValue.loading(), cast: AsyncValue.loading(), recommendations: AsyncValue.loading());
  }

  Future<void> _loadDetails(int movieId) async {
    final repo = ref.read(movieDetailRepositoryProvider);

    final results = await Future.wait([
      AsyncValue.guard(() => repo.getMovieDetails(movieId)),
      AsyncValue.guard(() => repo.getMovieCredits(movieId)),
      AsyncValue.guard(() => repo.getMovieVideos(movieId)),
      AsyncValue.guard(() => repo.getMovieRecommendations(movieId)),
    ]);

    final movieResult = results[0] as AsyncValue<Movie>;
    final castResult = results[1] as AsyncValue<List<Cast>>;
    final videosResult = results[2] as AsyncValue<List<Video>>;
    final recommendationsResult = results[3] as AsyncValue<List<Movie>>;

    String? trailerKey;

    if (videosResult is AsyncData<List<Video>>) {
      final videos = videosResult.value;
      final trailer = videos.firstWhere(
        (video) => video.type.toLowerCase() == 'Trailer' && video.site.toLowerCase() == 'youtube',
        orElse: () => videos.firstWhere(
          (video) => video.site.toLowerCase() == 'youtube',
          orElse: () => const Video(id: '', key: '', name: '', type: '', site: ''),
        ),
      );

      if (trailer.key.isNotEmpty) {
        trailerKey = trailer.key;
      }
    }

    state = state.copyWith(
      movie: movieResult,
      cast: castResult,
      recommendations: recommendationsResult,
      trailerKey: trailerKey,
    );
  }
}
