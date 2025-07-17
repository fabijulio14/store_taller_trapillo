import '../../data/models/user_registration_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  Future<bool> registerUser(UserRegistration user);
  Future<bool> loginUser(String email, String password);
  Future<void> logoutUser();
  Future<User?> getCurrentUser();
  Stream<User?> get authStateChanges;
}
