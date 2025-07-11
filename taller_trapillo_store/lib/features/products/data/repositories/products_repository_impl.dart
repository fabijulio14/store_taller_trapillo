import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/datasource/products_remote_datasource.dart';
import '../../domain/repositories/products_repository.dart';
import '../models/product_model.dart';
import '../datasources/products_remote_datasource.dart';

part 'products_repository_impl.g.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource _remoteDataSource;

  ProductsRepositoryImpl({required ProductsRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  @override
  Future<List<Product>> getProducts({bool forceRefresh = false}) async {
    try {
      return await _remoteDataSource.getProducts();
    } catch (e) {
      rethrow;
    }
  }
}

/// Provider para el repositorio de productos
@riverpod
ProductsRepository productsRepository(Ref ref) {
  final remoteDataSource = ref.watch(productsRemoteDataSourceProvider);

  return ProductsRepositoryImpl(remoteDataSource: remoteDataSource);
}
