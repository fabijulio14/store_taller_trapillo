import '../../data/models/user_registration_model.dart';

abstract class UserRemoteDataSource {
  Future<bool> registerUser(UserRegistration user);
}
