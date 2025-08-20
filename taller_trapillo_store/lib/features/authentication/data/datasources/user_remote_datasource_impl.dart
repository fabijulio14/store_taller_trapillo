import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/user_registration_model.dart';
import '../../domain/datasource/user_remote_datasource.dart';

import 'package:firebase_auth/firebase_auth.dart';

part 'user_remote_datasource_impl.g.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  UserRemoteDataSourceImpl({required FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth;

  @override
  Future<bool> registerUser(UserRegistration user) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      return credential.user != null;
    } on FirebaseAuthException catch (e) {
      throw Exception('Error registering user: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<User?> loginUser(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception('Error logging in: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<void> logoutUser() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception('Error logging out: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}

@riverpod
UserRemoteDataSource userRemoteDataSource(Ref ref) {
  return UserRemoteDataSourceImpl(firebaseAuth: FirebaseAuth.instance);
}
