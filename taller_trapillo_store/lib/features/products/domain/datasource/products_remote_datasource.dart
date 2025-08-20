import '../../data/models/product_model.dart';

/// Datasource abstracto para definir el contrato
abstract class ProductsRemoteDataSource {
  Future<List<Product>> getProducts();
  Future<List<Product>> getProductsFromFirestore();
}
