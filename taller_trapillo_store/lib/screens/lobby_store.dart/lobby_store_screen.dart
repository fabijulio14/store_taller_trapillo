import 'package:flutter/material.dart';

import '../../data/repository/producto_repository.dart';
import 'widgets/best_sellers.dart';
import 'widgets/categories.dart';
import 'widgets/product_list.dart';
import 'widgets/promo_section.dart';

class LobbyStoreView extends StatelessWidget {
  const LobbyStoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Taller del trapillo'), actions: [Icon(Icons.filter_list)]),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text('Categorías', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          CategoriesSection(),
          PromotionsSection(),
          BestSellersSection(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: IconButton(icon: Icon(Icons.home), onPressed: () {}),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Carrito'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
        currentIndex: 0,
        onTap: (index) {},
      ),
    );
  }

  // Future<List<Producto>> _getProducts() async {
  //   // Llama al repository para obtener productos
  //   final productoRepository = ProductoRepository();
  //   final List<Producto> productos = await productoRepository.getProduct();
  //   return productos;
  // }
}
