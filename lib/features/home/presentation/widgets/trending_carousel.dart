import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reel_vault/core/theme/app_colors.dart';
import 'package:reel_vault/features/home/data/models/movie.dart';

class TrendingCarousel extends StatefulWidget {
  const TrendingCarousel({required this.movies, super.key});

  final List<Movie> movies;

  @override
  State<TrendingCarousel> createState() => _TrendingCarouselState();
}

class _TrendingCarouselState extends State<TrendingCarousel> {
  late final PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.92);
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!mounted || widget.movies.isEmpty) return;
      final featuredLength = widget.movies.take(5).length;
      if (featuredLength == 0) return;
      final nextPage = (_currentPage + 1) % featuredLength;
      unawaited(
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOut,
        ),
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.movies.isEmpty) return const SizedBox.shrink();

    // Limit to top 5 movies
    final featuredMovies = widget.movies.take(5).toList();

    return Column(
      children: [
        SizedBox(
          height: 190,
          child: PageView.builder(
            controller: _pageController,
            itemCount: featuredMovies.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final movie = featuredMovies[index];
              final backdropUrl = movie.backdropPath != null ? 'https://image.tmdb.org/t/p/w780${movie.backdropPath}' : null;

              return GestureDetector(
                onTap: () => context.push('/movie/${movie.id}'),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      children: [
                        // Backdrop Image
                        Positioned.fill(
                          child: backdropUrl != null
                              ? Image.network(
                                  backdropUrl,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const ColoredBox(
                                      color: AppColors.cardBackground,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) => const ColoredBox(
                                    color: AppColors.cardBackground,
                                    child: Center(
                                      child: Icon(
                                        Icons.broken_image_outlined,
                                        color: AppColors.textSecondary,
                                        size: 48,
                                      ),
                                    ),
                                  ),
                                )
                              : const ColoredBox(
                                  color: AppColors.cardBackground,
                                  child: Center(
                                    child: Icon(
                                      Icons.movie_outlined,
                                      color: AppColors.textSecondary,
                                      size: 48,
                                    ),
                                  ),
                                ),
                        ),
                        // Bottom gradient overlay
                        Positioned.fill(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withValues(alpha: 0.85),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                        // Movie Info Overlay
                        Positioned(
                          left: 16,
                          bottom: 16,
                          right: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Title
                              Text(
                                movie.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              // Description or Release Date
                              Text(
                                movie.overview ?? 'Ver detalles',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        // Dots Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            featuredMovies.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 6,
              width: _currentPage == index ? 20 : 6,
              decoration: BoxDecoration(
                color: _currentPage == index ? AppColors.primary : AppColors.textSecondary.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
