import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/user_repository_impl.dart';

part 'login_view_model.g.dart';

enum LoginState { initial, loading, success, error }

@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginState build() {
    return LoginState.initial;
  }

  Future<bool> loginUser({required String email, required String password}) async {
    state = LoginState.loading;

    try {
      final userRepository = ref.read(userRepositoryProvider);
      final success = await userRepository.loginUser(email, password);

      if (success != null) {
        state = LoginState.success;
        return true;
      } else {
        state = LoginState.error;
        return false;
      }
    } catch (e) {
      state = LoginState.error;
      return false;
    }
  }

  void resetState() {
    state = LoginState.initial;
  }
}
