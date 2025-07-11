import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/datasource/products_remote_datasource.dart';
import '../models/product_model.dart';
import '../../../../core/providers/dio_provider.dart';

part 'products_remote_datasource_impl.g.dart';

/// Implementación del datasource remoto
class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final Dio _dio;

  ProductsRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<Product>> getProducts() async {
    try {
      final response = await _dio.get('/getProducts');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((item) => Product.fromJsonCustom(item)).toList();
      } else {
        throw Exception('Error al cargar productos: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Error de conexión: ${e.message}');
    } catch (e) {
      throw Exception('Error inesperado: $e');
    }
  }
}

@riverpod
ProductsRemoteDataSource productsRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ProductsRemoteDataSourceImpl(dio: dio);
}
