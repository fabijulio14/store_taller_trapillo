import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/profile_repository.dart';
import '../../domain/datasources/profile_datasource.dart';
import '../datasources/profile_datasource_impl.dart';
import '../models/user_profile_model.dart';

part 'profile_repository_impl.g.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource _dataSource;

  ProfileRepositoryImpl(this._dataSource);

  @override
  Future<UserProfile?> getUserProfile(String uid) async {
    try {
      return await _dataSource.getUserProfile(uid);
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
ProfileRepository profileRepository(Ref ref) {
  final dataSource = ref.watch(profileDataSourceProvider);
  return ProfileRepositoryImpl(dataSource);
}
