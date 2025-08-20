import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // Rutas constantes
  static const String login = '/login';
  static const String register = '/register';
  static const String store = '/store';
  static const String productDetail = '/store/product';
  static const String profile = '/profile';

  // Métodos de navegación útiles
  static void goToLogin(BuildContext context) {
    context.go(login);
  }

  static void goToRegister(BuildContext context) {
    context.push(register);
  }

  static void goToStore(BuildContext context) {
    context.go(store);
  }

  static void goBack(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      // Si no puede hacer pop, ir al store
      context.go(store);
    }
  }

  static void goToProfile(BuildContext context) {
    context.push(profile);
  }
}

// Extension para facilitar el uso de las rutas
extension AppRoutesExtension on BuildContext {
  void goToLogin() => AppRoutes.goToLogin(this);
  void goToRegister() => AppRoutes.goToRegister(this);
  void goToStore() => AppRoutes.goToStore(this);
  void goBack() => AppRoutes.goBack(this);
  void goToProfile() => AppRoutes.goToProfile(this);
}
