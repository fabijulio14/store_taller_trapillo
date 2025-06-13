import 'package:flutter/material.dart';

import '../../../data/models/producto_model.dart';
import '../../../data/repository/producto_repository.dart';
import 'product_list.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    final categories = ['Bolsos', 'Cestas', 'Accesorios'];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Wrap(
        spacing: 8,
        children: List.generate(categories.length, (index) {
          final cat = categories[index];
          return ChoiceChip(
            label: Text(cat),
            selected: selectedIndex == index,
            onSelected: (selected) {
              _getProducts().then((productos) {
                Navigator.push(
                  // ignore: use_build_context_synchronously
                  context,
                  MaterialPageRoute(builder: (context) => ProductoList(productos: productos)),
                );
              });
            },
            selectedColor: Colors.blue[200],
            backgroundColor: Colors.grey[200],
          );
        }),
      ),
    );
  }
}

Future<List<Producto>> _getProducts() async {
  // Llama al repository para obtener productos
  final productoRepository = ProductoRepository();
  final List<Producto> productos = await productoRepository.getProduct();
  return productos;
}
