import '../../data/models/user_registration_model.dart';

abstract class UserRepository {
  Future<bool> registerUser(UserRegistration user);
}
