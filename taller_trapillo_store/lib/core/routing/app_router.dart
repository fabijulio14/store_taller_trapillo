import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/authentication/ui/screen/login_screen.dart';
import '../../features/products/ui/screens/lobby_store_screen.dart';
import '../../features/authentication/ui/widget/register_user.dart';

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
    ],

    // Manejo de errores de navegación
    errorBuilder:
        (context, state) => Scaffold(
          appBar: AppBar(title: const Text('Página no encontrada')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  'Página no encontrada: ${state.uri}',
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context.go('/login'),
                  child: const Text('Ir al inicio'),
                ),
              ],
            ),
          ),
        ),
  );
}
