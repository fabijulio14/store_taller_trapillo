import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/app_colors.dart';
import '../../features/authentication/ui/screen/login_screen.dart';
import '../../features/products/ui/screens/lobby_store_screen.dart';
import '../../features/authentication/ui/widget/register_user.dart';
import '../../features/profile/ui/screen/profile_screen.dart';
import '../../l10n/generated/app_localizations.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: <RouteBase>[
      // Ruta de Login
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),

      // Ruta de Registro
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterUser();
        },
      ),

      // Ruta principal de la tienda
      GoRoute(
        path: '/store',
        name: 'store',
        builder: (BuildContext context, GoRouterState state) {
          return const LobbyStoreScreen();
        },
      ),

      // Ruta de perfil de usuario
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (BuildContext context, GoRouterState state) {
          return const ProfileScreen();
        },
      ),
    ],

    // Manejo de errores de navegación
    errorBuilder: (context, state) {
      final localizations = AppLocalizations.of(context);
      return Scaffold(
        appBar: AppBar(title: Text(localizations?.pageNotFound ?? 'Page not found')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: AppColors.error),
              const SizedBox(height: 16),
              Text(
                '${localizations?.pageNotFound ?? 'Page not found'}: ${state.uri}',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.go('/login'),
                child: Text(localizations?.goToHome ?? 'Go to Home'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
