import 'package:dio/dio.dart' show Dio;

import '../../data/models/product_model.dart';

class ProductsRepository {
  final Dio _dio = Dio();
  final String apiUrl = 'http://localhost:3001/getProducts'; // mockoon

  // Obtener todos los productos desde el API
  Future<List<Product>> getProduct() async {
    final response = await _dio.get(apiUrl);
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((item) => Product.fromMap(item)).toList();
    } else {
      throw Exception('Error al cargar productos');
    }
  }
}
