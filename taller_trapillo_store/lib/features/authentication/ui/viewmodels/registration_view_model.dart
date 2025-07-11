import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/user_registration_model.dart';
import '../../data/repositories/user_repository_impl.dart';

part 'registration_view_model.g.dart';

// Estados del registro
enum RegistrationState { initial, loading, success, error }

// Notifier para manejar el estado del registro
@riverpod
class RegistrationViewModel extends _$RegistrationViewModel {
  @override
  RegistrationState build() {
    return RegistrationState.initial;
  }

  Future<bool> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    state = RegistrationState.loading;

    try {
      final userRepository = ref.read(userRepositoryProvider);
      final user = UserRegistration(name: name, email: email, password: password);

      final success = await userRepository.registerUser(user);

      if (success) {
        state = RegistrationState.success;
        return true;
      } else {
        state = RegistrationState.error;
        return false;
      }
    } catch (e) {
      state = RegistrationState.error;
      return false;
    }
  }

  void resetState() {
    state = RegistrationState.initial;
  }
}
