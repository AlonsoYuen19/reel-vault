import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reel_vault/features/home/presentation/screens/home_screen.dart';
import 'package:reel_vault/features/movie_detail/presentation/screens/movie_detail_screen.dart';
import 'package:reel_vault/features/navigation/presentation/screens/main_shell.dart';
import 'package:reel_vault/features/search/presentation/screens/search_screen.dart';
import 'package:reel_vault/features/watchlist/presentation/screens/watchlist_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',

  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainShell(
          navigationShell: navigationShell,
        );
      },
      branches: <StatefulShellBranch>[
        // Rama 1: Inicio
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        // Rama 2: Buscar
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/search',
              builder: (context, state) => const SearchScreen(),
            ),
          ],
        ),
        // Rama 3: Favoritos
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/favorites',
              builder: (context, state) => const WatchlistScreen(),
            ),
          ],
        ),
        // Rama 4: Perfil (Placeholder)
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/profile',
              builder: (context, state) => const Scaffold(
                body: Center(
                  child: Text('Perfil (Placeholder)'),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/movie/:id',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final idStr = state.pathParameters['id'] ?? '0';
        final id = int.tryParse(idStr) ?? 0;
        return MovieDetailScreen(movieId: id);
      },
    ),
  ],
);
