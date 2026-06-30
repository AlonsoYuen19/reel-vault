import 'dart:async';
import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:reel_vault/features/home/data/models/movie.dart';
import 'package:reel_vault/features/movie_detail/presentation/viewmodels/movie_detail_view_model.dart';
import 'package:reel_vault/features/search/data/repositories/search_repository.dart';
import 'package:reel_vault/features/search/presentation/viewmodels/search_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_view_model.g.dart';

@riverpod
SearchRepository searchRepository(Ref ref) {
  return SearchRepository();
}

@riverpod
class SearchViewModel extends _$SearchViewModel {
  Timer? _debounceTimer;

  @override
  SearchState build() {
    ref.onDispose(() {
      _debounceTimer?.cancel();
    });
    return const SearchState(
      query: '',
      results: AsyncValue.data([]),
      searchHistory: [],
      aiResponse: AsyncValue.data(null),
      aiRecommendations: [],
    );
  }

  void toggleAIMode() {
    state = state.copyWith(
      isSearchingAI: !state.isSearchingAI,
      query: '',
      results: const AsyncValue.data([]),
      aiResponse: const AsyncValue.data(null),
      aiRecommendations: [],
    );
  }

  void setSearchQuery(String query) {
    state = state.copyWith(query: query);
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      if (query.trim().isEmpty) {
        state = state.copyWith(results: const AsyncValue.data([]));
        return;
      }
      state = state.copyWith(
        results: const AsyncValue.loading(),
      );

      try {
        final repo = ref.read(searchRepositoryProvider);
        final results = await repo.searchMovies(query);
        state = state.copyWith(results: AsyncValue.data(results));
      } on Object catch (err, stack) {
        state = state.copyWith(results: AsyncValue.error(err, stack));
      }
    });
  }

  void addToHistory(String query) {
    final cleanQuery = query.trim();
    if (cleanQuery.isEmpty) return;
    final currentHistory = List<String>.from(state.searchHistory)
      ..remove(cleanQuery)
      ..insert(0, cleanQuery);
    if (currentHistory.length > 5) {
      currentHistory.removeLast();
    }
    state = state.copyWith(searchHistory: currentHistory);
  }

  void clearHistory() {
    state = state.copyWith(searchHistory: []);
  }

  Future<void> searchAI(String prompt) async {
    final cleanPrompt = prompt.trim();
    if (cleanPrompt.isEmpty) return;
    state = state.copyWith(
      aiResponse: const AsyncValue.loading(),
      aiRecommendations: [],
    );
    try {
      const apiKey = String.fromEnvironment('GEMINI_API_KEY');
      if (apiKey.isEmpty) {
        throw Exception(
          'Falta configurar la API Key de Gemini. Ejecuta la app con: '
          '--dart-define=GEMINI_API_KEY=tu_api_key',
        );
      }
      final systemInstruction = Content.system(
        'Eres un recomendador de películas experto y amigable de la aplicación Reel Vault. '
        'Debes responder ÚNICAMENTE con un objeto JSON válido. No incluyas formateo markdown de tipo ```json. '
        'El JSON debe tener exactamente dos campos:\n'
        '- "explanation": una descripción o reseña corta del porqué de las recomendaciones en base al prompt del usuario.\n'
        '- "movie_ids": una lista de números enteros representando los IDs reales de TMDB para las películas recomendadas (máximo 5).',
      );
      final model = GenerativeModel(
        model: 'gemini-3.5-flash',
        apiKey: apiKey,
        systemInstruction: systemInstruction,
      );
      final response = await model.generateContent([Content.text(cleanPrompt)]);
      var text = response.text ?? '';
      // Limpieza por si Gemini incluye el formateo markdown ```json
      if (text.startsWith('```json')) {
        text = text.substring(7);
      }
      if (text.endsWith('```')) {
        text = text.substring(0, text.length - 3);
      }
      text = text.trim();
      final jsonMap = json.decode(text) as Map<String, dynamic>;
      final explanation = jsonMap['explanation'] as String? ?? '';
      final movieIds = List<int>.from(jsonMap['movie_ids'] as List<dynamic>? ?? []);
      // Cargamos el detalle de las películas recomendadas en paralelo
      final detailRepo = ref.read(movieDetailRepositoryProvider);
      final futures = movieIds.map(
        (id) => AsyncValue.guard(() => detailRepo.getMovieDetails(id)),
      );
      final results = await Future.wait(futures);
      final recommendedMovies = <Movie>[];
      for (final res in results) {
        if (res is AsyncData<Movie>) {
          recommendedMovies.add(res.value);
        }
      }
      state = state.copyWith(
        aiResponse: AsyncValue.data(explanation),
        aiRecommendations: recommendedMovies,
      );
      addToHistory(cleanPrompt);
    } on Object catch (err, stack) {
      state = state.copyWith(aiResponse: AsyncValue.error(err, stack));
    }
  }
}
