import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reel_vault/features/home/presentation/screens/home_screen.dart';
import 'package:reel_vault/features/movie_detail/presentation/screens/movie_detail_screen.dart';
import 'package:reel_vault/features/navigation/presentation/screens/main_shell.dart';

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
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/',
              builder: (context, state) => const HomeScreen(),
              routes: [
                GoRoute(
                  path: 'movie/:id',
                  builder: (context, state) {
                    final idStr = state.pathParameters['id'] ?? '0';
                    final id = int.tryParse(idStr) ?? 0;
                    return MovieDetailScreen(movieId: id);
                  },
                ),
              ],
            ),
          ],
        ),
        // Rama 2: Buscar (Placeholder)
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/search',
              builder: (context, state) => const Scaffold(
                body: Center(
                  child: Text('Buscar (Placeholder)'),
                ),
              ),
            ),
          ],
        ),
        // Rama 3: Favoritos (Placeholder)
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/favorites',
              builder: (context, state) => const Scaffold(
                body: Center(
                  child: Text('Favoritos (Placeholder)'),
                ),
              ),
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
  ],
);
