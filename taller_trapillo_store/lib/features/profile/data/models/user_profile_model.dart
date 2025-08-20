import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String uid,
    required String email,
    String? name,
    String? username,
    String? displayName,
    String? photoURL,
    String? phone,
    String? phoneNumber,
    String? address,
    String? country,
    DateTime? createdAt,
    DateTime? lastLoginAt,
    DateTime? updatedAt,
    bool? emailVerified,
    @Default({}) Map<String, dynamic> additionalInfo,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
}
