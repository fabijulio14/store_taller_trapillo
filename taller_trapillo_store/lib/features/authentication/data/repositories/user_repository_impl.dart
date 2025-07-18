import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_datasource_impl.dart';
import '../models/user_registration_model.dart';
import '../../domain/datasource/user_remote_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository_impl.g.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remoteDataSource;

  UserRepositoryImpl(this._remoteDataSource);

  @override
  Future<bool> registerUser(UserRegistration user) async {
    try {
      return await _remoteDataSource.registerUser(user);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> loginUser(String email, String password) async {
    try {
      final user = await _remoteDataSource.loginUser(email, password);
      return user != null;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> logoutUser() async {
    try {
      await _remoteDataSource.logoutUser();
    } catch (e) {
      throw Exception('Error al cerrar sesión: $e');
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    try {
      return _remoteDataSource.getCurrentUser();
    } catch (e) {
      throw Exception('Error al obtener usuario actual: $e');
    }
  }

  @override
  Stream<User?> get authStateChanges {
    return _remoteDataSource.authStateChanges;
  }
}

@riverpod
UserRepository userRepository(Ref ref) {
  final userRemoteDataSource = ref.watch(userRemoteDataSourceProvider);
  return UserRepositoryImpl(userRemoteDataSource);
}
