import 'package:dio/dio.dart' show Dio;

import '../models/producto_model.dart';

class ProductoRepository {
  final Dio _dio = Dio();
  final String apiUrl = 'http://localhost:3001/getProducts'; // mockoon

  // Obtener todos los productos desde el API
  Future<List<Producto>> getProduct() async {
    final response = await _dio.get(apiUrl);
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((item) => Producto.fromMap(item)).toList();
    } else {
      throw Exception('Error al cargar productos');
    }
  }
}
