import 'package:flutter/material.dart';

import '../../../data/models/producto_model.dart';

class ProductoList extends StatelessWidget {
  final List<Producto> productos;

  const ProductoList({super.key, required this.productos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Taller del trapillo'), actions: [Icon(Icons.filter_list)]),
      backgroundColor: const Color(0xFFE9EEF2),
      body: SafeArea(
        child: Column(
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Center(
                child: Text('Bolsos', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
            ),
            // Grid of images and names
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GridView.builder(
                  itemCount: productos.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.89,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    final producto = productos[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => _showProductDetail(context, producto),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: AspectRatio(
                                aspectRatio: 1.3,
                                child: Image.asset(
                                  producto.imagen,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => Container(color: Colors.grey[200]),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12, top: 10, right: 12),
                            child: Text(
                              producto.nombre,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xFF2C3E66),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showProductDetail(BuildContext context, Producto producto) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    builder:
        (context) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    producto.imagen,
                    height: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(color: Colors.grey[200], height: 150),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(producto.nombre, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(producto.descripcion, style: TextStyle(fontSize: 16)),
              SizedBox(height: 12),
              Text(
                '\$${producto.precio}',
                style: TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
  );
}
