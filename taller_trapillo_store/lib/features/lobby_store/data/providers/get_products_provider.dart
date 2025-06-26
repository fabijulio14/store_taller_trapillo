import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/products_repository.dart';
import '../models/product_model.dart';

part 'get_products_provider.g.dart';

//instancia del repositorio de productos
final getProductsProvider = Provider<ProductsRepository>((ref) => ProductsRepository());

//proveedor para obtener los productos
@riverpod
class ProductList extends _$ProductList {
  final Set<int> _favoriteIds = {};

  @override
  Future<List<Product>> build() async {
    //llamada al repositorio para obtener los productos
    return ref.watch(getProductsProvider).getProduct();
  }

  /// Método para alternar favorito
  void toggleFavorite(int productId) {
    if (_favoriteIds.contains(productId)) {
      _favoriteIds.remove(productId);
    } else {
      _favoriteIds.add(productId);
    }
    // Notifica a los listeners para que los widgets se actualicen
    state = AsyncValue.data(state.value ?? []);
  }

  // Saber si un producto es favorito
  bool isFavorite(int productId) => _favoriteIds.contains(productId);

  // Obtener la lista de productos favoritos
  List<Product> get favoriteProducts {
    final products = state.value ?? [];
    return products.where((p) => _favoriteIds.contains(p.id)).toList();
  }
}
