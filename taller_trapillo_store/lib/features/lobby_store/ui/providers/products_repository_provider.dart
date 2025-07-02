import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/products_repository.dart';

part 'products_repository_provider.g.dart';

@riverpod
ProductsRepository productsRepository(ProductsRepositoryRef ref) {
  return ProductsRepository();
}
