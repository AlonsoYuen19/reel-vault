import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reel_vault/core/theme/app_colors.dart';
import 'package:reel_vault/features/home/data/models/movie.dart';
import 'package:reel_vault/features/home/presentation/widgets/movie_card.dart';
import 'package:reel_vault/features/movie_detail/data/models/cast.dart';
import 'package:reel_vault/features/movie_detail/presentation/viewmodels/movie_detail_view_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailScreen extends ConsumerStatefulWidget {
  const MovieDetailScreen({required this.movieId, super.key});

  final int movieId;

  @override
  ConsumerState<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends ConsumerState<MovieDetailScreen> {
  YoutubePlayerController? _youtubeController;
  bool _playTrailer = false;

  @override
  void dispose() {
    final controller = _youtubeController;
    if (controller != null) {
      unawaited(controller.close().catchError((_) {}));
    }
    super.dispose();
  }

  // limpiamos el controlador anterior para cargar el nuevo trailer.
  @override
  void didUpdateWidget(covariant MovieDetailScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.movieId != oldWidget.movieId) {
      final controller = _youtubeController;
      if (controller != null) {
        unawaited(controller.close().catchError((_) {}));
      }
      _youtubeController = null;
      _playTrailer = false;
    }
  }

  void _initYoutubeController(String videoId) {
    if (_youtubeController != null) return;
    _youtubeController = YoutubePlayerController.fromVideoId(
      videoId: videoId,
      autoPlay: true,
      params: const YoutubePlayerParams(
        showFullscreenButton: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(movieDetailViewModelProvider(widget.movieId));

    return Scaffold(
      backgroundColor: AppColors.background,
      body: state.movie.when(
        data: (movie) {
          // Inicializamos el reproductor de YouTube si el trailer está disponible
          if (state.trailerKey != null && _youtubeController == null) {
            _initYoutubeController(state.trailerKey!);
          }

          return CustomScrollView(
            slivers: [
              _buildSliverAppBar(movie, state.trailerKey),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMovieInfoSection(movie),
                      const SizedBox(height: 24),
                      _buildOverviewSection(movie),
                      const SizedBox(height: 24),
                      _buildCastSection(state.cast),
                      const SizedBox(height: 24),
                      _buildRecommendationsSection(state.recommendations),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
        error: (err, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: AppColors.error),
                const SizedBox(height: 16),
                Text(
                  'Error al cargar el detalle',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  err.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    ref.invalidate(movieDetailViewModelProvider(widget.movieId));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Reintentar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSliverAppBar(Movie movie, String? trailerKey) {
    final backdropUrl = movie.backdropPath != null ? 'https://image.tmdb.org/t/p/w780${movie.backdropPath}' : null;
    final screenWidth = MediaQuery.of(context).size.width;
    final mediaHeight = screenWidth * 9 / 16; // Mantiene la relación de aspecto 16:9

    return SliverAppBar(
      expandedHeight: mediaHeight,
      pinned: true,
      backgroundColor: AppColors.background,
      leading: IconButton(
        icon: const CircleAvatar(
          backgroundColor: Colors.black38,
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            if (_playTrailer && _youtubeController != null)
              YoutubePlayer(
                controller: _youtubeController!,
              )
            else ...[
              if (backdropUrl != null)
                Image.network(
                  backdropUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(Icons.broken_image, size: 64, color: AppColors.textSecondary),
                  ),
                )
              else
                const ColoredBox(
                  color: AppColors.cardBackground,
                  child: Center(
                    child: Icon(Icons.movie, size: 64, color: AppColors.textSecondary),
                  ),
                ),
              // Degradado oscuro para que resalte la UI y los textos
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black54,
                      Colors.transparent,
                      AppColors.background,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Botón de Play para el Tráiler
              if (trailerKey != null)
                Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _playTrailer = true;
                      });
                    },
                    child: const CircleAvatar(
                      radius: 32,
                      backgroundColor: AppColors.primary,
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildMovieInfoSection(Movie movie) {
    final releaseYear = movie.releaseDate != null ? movie.releaseDate!.year.toString() : 'N/A';
    final voteAverage = movie.voteAverage != null ? movie.voteAverage!.toStringAsFixed(1) : '0.0';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie.title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(Icons.calendar_today, size: 16, color: AppColors.textSecondary),
            const SizedBox(width: 6),
            Text(
              releaseYear,
              style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
            ),
            const SizedBox(width: 20),
            const Icon(Icons.star, size: 16, color: AppColors.secondary),
            const SizedBox(width: 6),
            Text(
              '$voteAverage / 10',
              style: const TextStyle(
                color: AppColors.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOverviewSection(Movie movie) {
    if (movie.overview == null || movie.overview!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sinopsis',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          movie.overview!,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildCastSection(AsyncValue<List<Cast>> castState) {
    return castState.when(
      data: (castList) {
        if (castList.isEmpty) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reparto Principal',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 115,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: castList.length,
                itemBuilder: (context, index) {
                  final actor = castList[index];
                  final profileUrl = actor.profilePath != null ? 'https://image.tmdb.org/t/p/w185${actor.profilePath}' : null;

                  return Container(
                    width: 80,
                    margin: const EdgeInsets.only(right: 12),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColors.cardBackground,
                          backgroundImage: profileUrl != null ? NetworkImage(profileUrl) : null,
                          child: profileUrl == null ? const Icon(Icons.person, color: AppColors.textSecondary) : null,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          actor.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          actor.character ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      ),
      error: (err, stack) => const SizedBox.shrink(),
    );
  }

  Widget _buildRecommendationsSection(AsyncValue<List<Movie>> recommendationsState) {
    return recommendationsState.when(
      data: (movies) {
        if (movies.isEmpty) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Películas Recomendadas',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Container(
                    width: 130,
                    margin: const EdgeInsets.only(right: 16),
                    child: MovieCard(movie: movie),
                  );
                },
              ),
            ),
          ],
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      ),
      error: (err, stack) => const SizedBox.shrink(),
    );
  }
}
