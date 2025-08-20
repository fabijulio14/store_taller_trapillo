import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taller_trapillo_store/l10n/generated/app_localizations.dart';

import '../../data/models/product_model.dart';
import '../../data/repositories/products_repository_impl.dart';

part 'product_list_view_model.g.dart';

@riverpod
class ProductListViewModel extends _$ProductListViewModel {
  @override
  Future<List<Product>> build() async {
    final repository = ref.read(productsRepositoryProvider);
    return repository.getProducts();
  }

  Future<List<Product>> getProductsFromFirestore() async {
    final repository = ref.read(productsRepositoryProvider);
    return await repository.getProductsFromFirestore();
  }

  List<Product> filterProductsByCategory(List<Product> products, String category) {
    return products.where((product) => product.category == category).toList();
  }

  String getCategoryName(String categoryId, AppLocalizations localizations) {
    switch (categoryId) {
      case 'handbags':
        return localizations.category_handbags;
      case 'baskets':
        return localizations.category_baskets;
      case 'accessories':
        return localizations.category_accessories;
      default:
        return categoryId;
    }
  }

  void updateProductFavoriteStatus(int productId, bool isFavorite) {
    state = state.whenData(
      (products) =>
          products.map((product) {
            if (product.id == productId) {
              return product.copyWith(isFavorite: isFavorite);
            }
            return product;
          }).toList(),
    );
  }
}
