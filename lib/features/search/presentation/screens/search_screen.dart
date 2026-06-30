import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reel_vault/core/theme/app_colors.dart';
import 'package:reel_vault/features/home/presentation/widgets/movie_card.dart';
import 'package:reel_vault/features/search/presentation/viewmodels/search_state.dart';
import 'package:reel_vault/features/search/presentation/viewmodels/search_view_model.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchViewModelProvider);
    final notifier = ref.read(searchViewModelProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildSearchBar(state, notifier),
              const SizedBox(height: 20),
              Expanded(
                child: state.isSearchingAI
                    ? _buildAISection(state, notifier)
                    : _buildStandardSection(state, notifier),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(SearchState state, SearchViewModel notifier) {
    return TextField(
      controller: _searchController,
      style: const TextStyle(color: AppColors.textPrimary),
      onChanged: (val) {
        if (!state.isSearchingAI) {
          notifier.setSearchQuery(val);
        }
      },
      onSubmitted: (val) async {
        if (state.isSearchingAI) {
          await notifier.searchAI(val);
        } else {
          notifier.addToHistory(val);
        }
      },
      decoration: InputDecoration(
        hintText: state.isSearchingAI
            ? 'Describe qué quieres ver (ej: ciencia ficción espacial)...'
            : 'Buscar películas...',
        hintStyle: const TextStyle(color: AppColors.textSecondary),
        prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
        suffixIcon: IconButton(
          icon: Icon(
            state.isSearchingAI ? Icons.auto_awesome : Icons.auto_awesome_outlined,
            color: state.isSearchingAI ? AppColors.primary : AppColors.textSecondary,
          ),
          onPressed: () {
            _searchController.clear();
            notifier.toggleAIMode();
          },
        ),
        filled: true,
        fillColor: AppColors.cardBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
      ),
    );
  }

  Widget _buildStandardSection(SearchState state, SearchViewModel notifier) {
    if (state.query.trim().isEmpty) {
      return _buildHistorySection(state, notifier);
    }

    return state.results.when(
      data: (movies) {
        if (movies.isEmpty) {
          return const Center(
            child: Text(
              'No se encontraron películas.',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
            ),
          );
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.68,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return MovieCard(movie: movie);
          },
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      ),
      error: (err, stack) => Center(
        child: Text(
          'Error al buscar: $err',
          style: const TextStyle(color: AppColors.error),
        ),
      ),
    );
  }

  Widget _buildHistorySection(SearchState state, SearchViewModel notifier) {
    if (state.searchHistory.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, size: 64, color: AppColors.textSecondary),
            SizedBox(height: 12),
            Text(
              'Busca tus películas favoritas o activa el Asistente IA',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Búsquedas Recientes',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () => notifier.clearHistory(),
              child: const Text(
                'Limpiar',
                style: TextStyle(color: AppColors.error, fontSize: 14),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: state.searchHistory.length,
            itemBuilder: (context, index) {
              final historyQuery = state.searchHistory[index];
              return ListTile(
                leading: const Icon(Icons.history, color: AppColors.textSecondary),
                title: Text(
                  historyQuery,
                  style: const TextStyle(color: AppColors.textPrimary),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.textSecondary),
                contentPadding: EdgeInsets.zero,
                onTap: () {
                  _searchController.text = historyQuery;
                  notifier.setSearchQuery(historyQuery);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAISection(SearchState state, SearchViewModel notifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.auto_awesome, color: AppColors.primary, size: 20),
            const SizedBox(width: 8),
            Text(
              'Asistente de Cine',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: state.aiResponse.when(
            data: (response) {
              if (response == null) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Pregúntame algo como:\n"Una película de viajes en el tiempo de comedia"\no "Películas similares a Inception"',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        height: 1.5,
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              }

              return ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      response,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ),
                  if (state.aiRecommendations.isNotEmpty) ...[
                    const SizedBox(height: 24),
                    const Text(
                      'Recomendaciones para ti',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.aiRecommendations.length,
                        itemBuilder: (context, index) {
                          final movie = state.aiRecommendations[index];
                          return Container(
                            width: 130,
                            margin: const EdgeInsets.only(right: 16),
                            child: MovieCard(movie: movie),
                          );
                        },
                      ),
                    ),
                  ],
                ],
              );
            },
            loading: () => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: AppColors.primary),
                  SizedBox(height: 16),
                  Text(
                    'Buscando las mejores recomendaciones...',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
            error: (err, stack) {
              final errStr = err.toString();
              var message = 'No se pudieron obtener recomendaciones en este momento.';

              if (errStr.contains('SocketException') || errStr.contains('Network') || errStr.contains('HttpException')) {
                message = 'Problema de conexión. Comprueba que tu dispositivo tiene acceso a internet.';
              } else if (errStr.contains('Quota exceeded') || errStr.contains('429') || errStr.contains('RESOURCE_EXHAUSTED')) {
                message = 'El servicio de recomendaciones está experimentando un alto tráfico. Por favor, vuelve a intentarlo en unos momentos.';
              }
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.error.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: AppColors.error,
                          size: 44,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          message,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () async {
                            if (_searchController.text.trim().isNotEmpty) {
                              await notifier.searchAI(_searchController.text);
                            }
                          },
                          icon: const Icon(Icons.refresh, size: 16),
                          label: const Text('Reintentar'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.black,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Theme(
                          data: Theme.of(context).copyWith(
                            dividerColor: Colors.transparent,
                          ),
                          child: ExpansionTile(
                            title: const Text(
                              'Detalles técnicos',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 11,
                              ),
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  errStr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 10,
                                    fontFamily: 'monospace',
                                  ),
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
      ],
    );
  }
}
