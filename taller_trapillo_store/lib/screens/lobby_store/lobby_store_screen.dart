import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';
import '../../data/repository/product_repository.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../theme/app_colors.dart';
import 'widgets/best_sellers.dart';
import 'widgets/categories_section.dart';
import 'widgets/promo_section.dart';

class LobbyStoreView extends StatefulWidget {
  const LobbyStoreView({super.key});

  @override
  State<LobbyStoreView> createState() => _LobbyStoreViewState();
}

class _LobbyStoreViewState extends State<LobbyStoreView> {
  List<Product> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getProducts();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.title_app),
        actions: [Icon(Icons.logout)],
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            localizations.title_categories,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CategoriesSection(products: products),
          PromotionsSection(getPromoProducts()),
          BestSellersSection(getFeaturedProducts()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: AppColors.secondary),
            label: localizations.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: AppColors.secondary),
            label: localizations.cart,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: AppColors.secondary),
            label: localizations.profile,
          ),
        ],
        currentIndex: 0,
        onTap: (index) {},
      ),
    );
  }

  Future<void> _getProducts() async {
    final productRepository = ProductRepository();
    final List<Product> loadedProducts = await productRepository.getProduct();
    setState(() {
      products = loadedProducts;
      isLoading = false;
    });
  }

  List<Product> getFeaturedProducts() {
    final featured = products.where((p) => p.featured).toList();
    return featured;
  }

  List<Product> getPromoProducts() {
    final promo = products.where((p) => p.promoPrice != null).toList();
    return promo;
  }
}
