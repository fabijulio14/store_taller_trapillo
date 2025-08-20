import '../../data/models/user_profile_model.dart';

abstract class ProfileRepository {
  Future<UserProfile?> getUserProfile(String uid);
}
