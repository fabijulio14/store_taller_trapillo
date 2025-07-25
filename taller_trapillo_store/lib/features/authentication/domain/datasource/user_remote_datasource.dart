import '../../data/models/user_registration_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRemoteDataSource {
  Future<bool> registerUser(UserRegistration user);
  Future<User?> loginUser(String email, String password);
  Future<void> logoutUser();
  User? getCurrentUser();
  Stream<User?> get authStateChanges;
}
