import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/models/user_registration_model.dart';
import '../../data/repositories/user_repository_impl.dart';

part 'registration_view_model.g.dart';

// Modelo para el resultado del registro
class RegistrationResult {
  final bool success;
  final String? error;
  final User? user;

  const RegistrationResult({required this.success, this.error, this.user});
}

// Notifier optimizado para manejar el estado del registro
@riverpod
class RegistrationViewModel extends _$RegistrationViewModel {
  @override
  AsyncValue<RegistrationResult?> build() {
    return const AsyncValue.data(null);
  }

  Future<RegistrationResult> registerUser(UserRegistration userRegistration) async {
    state = const AsyncValue.loading();

    try {
      // 1. Registrar usuario en Firebase Auth
      final userRepository = ref.read(userRepositoryProvider);
      final authSuccess = await userRepository.registerUser(userRegistration);

      if (!authSuccess) {
        const result = RegistrationResult(
          success: false,
          error: 'Error en el registro de autenticación',
        );
        state = AsyncValue.data(result);
        return result;
      }

      // 2. Obtener usuario actual
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        const result = RegistrationResult(
          success: false,
          error: 'Usuario no encontrado después del registro',
        );
        state = AsyncValue.data(result);
        return result;
      }

      // 3. Guardar datos adicionales en Firestore
      await _saveUserToFirestore(currentUser.uid, userRegistration);

      // 4. Resultado exitoso
      final result = RegistrationResult(success: true, user: currentUser);
      state = AsyncValue.data(result);
      return result;
    } catch (e, stackTrace) {
      final result = RegistrationResult(success: false, error: e.toString());
      state = AsyncValue.error(e, stackTrace);
      return result;
    }
  }

  void resetState() {
    state = const AsyncValue.data(null);
  }

  // Método de conveniencia para registrar con parámetros individuales
  Future<RegistrationResult> registerUserWithParams({
    required String name,
    required String email,
    required String password,
    String? username,
    String? phone,
    String? address,
    String? country,
  }) async {
    final userRegistration = UserRegistration(
      name: name,
      email: email,
      password: password,
      username: username,
      phone: phone,
      address: address,
      country: country,
    );

    return registerUser(userRegistration);
  }

  // Método privado optimizado para guardar usuario en Firestore
  Future<void> _saveUserToFirestore(String uid, UserRegistration userRegistration) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final userData = userRegistration.toJson();

      // Remover password del objeto que se guarda en Firestore
      userData.remove('password');

      // Agregar metadatos
      userData.addAll({
        'uid': uid,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
        'emailVerified': false,
      });

      await firestore.collection('users').doc(uid).set(userData);
    } catch (e) {
      rethrow; // Re-lanzar el error para que sea manejado en registerUser
    }
  }
}
