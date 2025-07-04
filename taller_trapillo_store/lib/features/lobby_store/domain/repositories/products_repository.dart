import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/product_model.dart';
import '../../data/repositories/products_repository_impl.dart';

part 'products_repository.g.dart';

/// Interfaz del repositorio de productos (Domain Layer)
abstract class ProductsRepository {
  Future<List<Product>> getProduct();
}

class ProductsRepositoryAdapter implements ProductsRepository {
  final ProductsRepositoryInterface _repositoryImpl;

  ProductsRepositoryAdapter(this._repositoryImpl);

  @override
  Future<List<Product>> getProduct() async {
    return await _repositoryImpl.getProducts();
  }
}

/// Provider para el repositorio de productos
@riverpod
ProductsRepository productsRepositoryDomain(Ref ref) {
  final repositoryImpl = ref.watch(productsRepositoryProvider);
  return ProductsRepositoryAdapter(repositoryImpl);
}
