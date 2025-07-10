import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'api_config_provider.g.dart';

/// Provider para la URL base de la API
@riverpod
String apiBaseUrl(Ref ref) {
  return 'http://192.168.1.157:3001'; // Mockoon local
}

/// Provider para headers de la API
@riverpod
Map<String, String> apiHeaders(Ref ref) {
  return {'Content-Type': 'application/json', 'Accept': 'application/json'};
}

/// Provider para timeout de red
@riverpod
Duration networkTimeout(Ref ref) {
  return const Duration(seconds: 10);
}
