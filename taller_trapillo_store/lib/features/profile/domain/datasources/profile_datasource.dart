import '../../data/models/user_profile_model.dart';

abstract class ProfileDataSource {
  Future<UserProfile?> getUserProfile(String uid);
}
