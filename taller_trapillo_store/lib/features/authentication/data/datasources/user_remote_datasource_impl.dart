import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/providers/dio_provider.dart';
import '../models/user_registration_model.dart';
import '../../domain/datasource/user_remote_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'user_remote_datasource_impl.g.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio _dio;
  final FirebaseAuth _firebaseAuth;

  UserRemoteDataSourceImpl({required Dio dio, required FirebaseAuth firebaseAuth})
    : _dio = dio,
      _firebaseAuth = firebaseAuth;

  @override
  Future<bool> registerUser(UserRegistration user) async {
    try {
      final UserCredential credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      if (user.name.isNotEmpty) {
        await credential.user?.updateDisplayName(user.name);
        await credential.user?.reload();
      }

      final response = await _dio.post(
        'https://trapillostore-20191-default-rtdb.firebaseio.com/user_list.json',
        data: {
          'uid': credential.user?.uid,
          'name': user.name,
          'email': user.email,
          'createdAt': DateTime.now().toIso8601String(),
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      return (response.statusCode == 200 || response.statusCode == 201) && credential.user != null;
    } on FirebaseAuthException catch (e) {
      throw Exception(_getFirebaseAuthErrorMessage(e.code));
    } on DioException catch (e) {
      if (_firebaseAuth.currentUser != null) {
        await _firebaseAuth.currentUser!.delete();
      }
      throw Exception('Error guardando datos del usuario: ${e.message}');
    } catch (e) {
      throw Exception('Error inesperado durante el registro: $e');
    }
  }

  @override
  Future<User?> loginUser(String email, String password) async {
    try {
      final UserCredential credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(_getFirebaseAuthErrorMessage(e.code));
    } catch (e) {
      throw Exception('Error inesperado durante el login: $e');
    }
  }

  @override
  Future<void> logoutUser() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Error al cerrar sesión: $e');
    }
  }

  @override
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  @override
  Stream<User?> get authStateChanges {
    return _firebaseAuth.authStateChanges();
  }

  String _getFirebaseAuthErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'weak-password':
        return 'La contraseña es muy débil.';
      case 'email-already-in-use':
        return 'Ya existe una cuenta con este email.';
      case 'invalid-email':
        return 'El email no es válido.';
      case 'user-not-found':
        return 'No se encontró usuario con este email.';
      case 'wrong-password':
        return 'Contraseña incorrecta.';
      case 'user-disabled':
        return 'Esta cuenta ha sido deshabilitada.';
      case 'too-many-requests':
        return 'Demasiados intentos. Intenta más tarde.';
      case 'operation-not-allowed':
        return 'Operación no permitida.';
      default:
        return 'Error de autenticación: $errorCode';
    }
  }
}

@riverpod
UserRemoteDataSource userRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  final firebaseAuth = FirebaseAuth.instance;
  return UserRemoteDataSourceImpl(dio: dio, firebaseAuth: firebaseAuth);
}
