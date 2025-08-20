import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/user_profile_model.dart';
import '../../data/repositories/profile_repository_impl.dart';

part 'profile_view_model.g.dart';

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  AsyncValue<UserProfile?> build() {
    return const AsyncValue.loading();
  }

  Future<void> loadUserProfile(String uid) async {
    state = const AsyncValue.loading();

    try {
      final repository = ref.read(profileRepositoryProvider);
      final profile = await repository.getUserProfile(uid);
      state = AsyncValue.data(profile);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

@riverpod
Stream<User?> authStateChanges(Ref ref) {
  return FirebaseAuth.instance.authStateChanges();
}
