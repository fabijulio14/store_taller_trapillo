import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/providers/dio_provider.dart';
import '../models/user_registration_model.dart';
import '../../domain/datasource/user_remote_datasource.dart';

part 'user_remote_datasource.g.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio _dio;

  UserRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<bool> registerUser(UserRegistration user) async {
    try {
      final response = await _dio.post(
        'https://trapillostore-20191-default-rtdb.firebaseio.com/user_list.json',
        data: user.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      return response.statusCode == 200 || response.statusCode == 201;
    } on DioException catch (e) {
      throw Exception('Error registering user: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}

@riverpod
UserRemoteDataSource userRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return UserRemoteDataSourceImpl(dio: dio);
}
