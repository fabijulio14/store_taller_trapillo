import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product_model.dart';
import '../datasources/products_remote_datasource.dart';

part 'products_repository_impl.g.dart';

abstract class ProductsRepositoryInterface {
  Future<List<Product>> getProducts({bool forceRefresh = false});
}

class ProductsRepositoryImpl implements ProductsRepositoryInterface {
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
ProductsRepositoryInterface productsRepository(Ref ref) {
  final remoteDataSource = ref.watch(productsRemoteDataSourceProvider);

  return ProductsRepositoryImpl(remoteDataSource: remoteDataSource);
}
