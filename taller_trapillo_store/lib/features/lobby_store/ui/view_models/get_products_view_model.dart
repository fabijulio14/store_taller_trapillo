import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/products_repository.dart';
import '../../data/models/product_model.dart';

part 'get_products_view_model.g.dart';

//instancia del repositorio de producto
final productsRepository = ProductsRepository();

//proveedor para obtener los productos
@riverpod
class ProductList extends _$ProductList {
  //final Set<int> _favoriteIds = {};

  @override
  Future<List<Product>> build() async {
    //llamada al repositorio para obtener los productos
    return productsRepository.getProduct();
  }
}

@riverpod
class FavoritesList extends _$FavoritesList {
  @override
  List<Product> build() => [];

  // Agrega un producto
  void addFavorite(Product product) {
    if (!state.contains(product)) {
      state = [...state, product];
    }
  }

  // Quita un producto
  void removeFavorite(Product product) {
    state = state.where((p) => p.id != product.id).toList();
  }

  // Verifica si un producto es favorito
  bool isFavorite(Product product) {
    return state.any((p) => p.id == product.id);
  }

  // Consulta la lista de favoritos
  List<Product> get favorites => state;

  void onPressedFavorite(Product product) {
    if (isFavorite(product)) {
      removeFavorite(product);
    } else {
      addFavorite(product);
    }
  }
}
