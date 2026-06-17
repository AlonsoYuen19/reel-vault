import 'package:flutter/material.dart';
import 'package:reel_vault/core/theme/app_colors.dart';
import 'package:reel_vault/features/home/data/models/movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final posterUrl = movie.posterPath != null ? 'https://image.tmdb.org/t/p/w342${movie.posterPath}' : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              // Poster Image
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.cardBackground,
                ),
                clipBehavior: Clip.antiAlias,
                child: posterUrl != null
                    ? Image.network(
                        posterUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.primary,
                              ),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) => const Center(
                          child: Icon(
                            Icons.broken_image_outlined,
                            color: AppColors.textSecondary,
                            size: 32,
                          ),
                        ),
                      )
                    : const Center(
                        child: Icon(
                          Icons.movie_outlined,
                          color: AppColors.textSecondary,
                          size: 32,
                        ),
                      ),
              ),
              // Rating Badge
              if (movie.voteAverage != null && movie.voteAverage! > 0)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground.withValues(alpha: 0.85),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: AppColors.secondary.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.secondary,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          movie.voteAverage!.toStringAsFixed(1),
                          style: const TextStyle(
                            color: AppColors.secondary,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Movie Title
        Text(
          movie.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
        ),
        const SizedBox(height: 4),
        // Movie Release Year
        Text(
          movie.releaseDate != null ? movie.releaseDate!.year.toString() : 'N/A',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.textSecondary,
              ),
        ),
      ],
    );
  }
}
