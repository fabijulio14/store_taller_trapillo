import '../../data/models/product_model.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProducts({bool forceRefresh = false});
  Future<List<Product>> getProductsFromFirestore();
}
