import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/products_repository.dart';

part 'products_repository_provider.g.dart';

@riverpod
ProductsRepository productsRepository(Ref ref) {
  return ref.watch(productsRepositoryDomainProvider);
}
