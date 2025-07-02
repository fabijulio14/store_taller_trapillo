import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taller_trapillo_store/l10n/generated/app_localizations.dart';

import '../../data/models/product_model.dart';
import '../providers/products_repository_provider.dart';

part 'get_products_view_model.g.dart';

@riverpod
class ProductListViewModel extends _$ProductListViewModel {
  @override
  Future<List<Product>> build() async {
    //llamada al repositorio a través del provider
    final repository = ref.read(productsRepositoryProvider);
    return repository.getProduct();
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
}
