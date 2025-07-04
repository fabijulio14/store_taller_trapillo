import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/product_model.dart';

part 'favorite_list_view_model.g.dart';

@riverpod
class FavoritesListViewModel extends _$FavoritesListViewModel {
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
