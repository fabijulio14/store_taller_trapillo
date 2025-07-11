import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api_config_provider.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(Ref ref) {
  final baseUrl = ref.watch(apiBaseUrlProvider);
  final headers = ref.watch(apiHeadersProvider);
  final timeout = ref.watch(networkTimeoutProvider);

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      connectTimeout: timeout,
      receiveTimeout: timeout,
      sendTimeout: timeout,
    ),
  );

  return dio;
}
