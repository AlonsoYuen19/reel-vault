import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reel_vault/features/home/presentation/viewmodels/home_view_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ReelVault - Home'),
      ),
      body: state.when(
        skipLoadingOnReload: true,
        data: (movies) => ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return ListTile(
              title: Text(movie.title),
              subtitle: Text(
                movie.overview ?? 'Sin descripción',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: movie.voteAverage != null ? Chip(label: Text(movie.voteAverage!.toStringAsFixed(1))) : null,
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: $err'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  await ref.read(homeViewModelProvider.notifier).loadPopularMovies();
                },
                child: const Text('Reintentar'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          // Ejemplo de "cargar más" (página 2)
          await ref.read(homeViewModelProvider.notifier).loadPopularMovies(page: 2);
        },
        label: const Text('Cargar más'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
