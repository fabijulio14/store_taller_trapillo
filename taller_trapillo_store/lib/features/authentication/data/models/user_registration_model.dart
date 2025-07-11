import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_registration_model.freezed.dart';
part 'user_registration_model.g.dart';

@freezed
class UserRegistration with _$UserRegistration {
  const factory UserRegistration({
    required String name,
    required String email,
    required String password,
  }) = _UserRegistration;

  factory UserRegistration.fromJson(Map<String, dynamic> json) => _$UserRegistrationFromJson(json);
}
