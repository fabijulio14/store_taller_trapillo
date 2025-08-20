import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taller_trapillo_store/core/routing/app_routes.dart';
import 'package:taller_trapillo_store/features/products/ui/view_models/product_list_view_model.dart';

import '../../../../l10n/generated/app_localizations.dart';
import '../../../../core/features/app_colors.dart';
import '../view_models/favorite_list_view_model.dart';
import '../widgets/best_sellers_section.dart';
import '../widgets/categories_section.dart';
import '../widgets/promotions_section.dart';
import '../../../../commons/widgets/products_List.dart';

class LobbyStoreScreen extends ConsumerWidget {
  const LobbyStoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    final productsState = ref.watch(productListViewModelProvider);
    final favorites = ref.watch(favoritesListViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.title_app),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              context.goToLogin();
            },
          ),
        ],
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
      ),
      body: productsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data:
            (products) => ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  localizations.title_categories,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                CategoriesSection(products: products),
                PromotionsSection(products.where((p) => p.promoPrice != null).toList()),
                BestSellersSection(products.where((p) => p.featured).toList()),
              ],
            ),
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
            icon: Icon(Icons.favorite_rounded, color: AppColors.secondary),
            label: localizations.profile,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: AppColors.secondary),
            label: localizations.profile,
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              // Home
              break;
            case 1:
              ref.read(productListViewModelProvider.notifier).getProductsFromFirestore();
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) =>
                          ProductsList(title: localizations.txt_favorite, productsList: favorites),
                ),
              );
              break;
            case 3:
              context.goToProfile();
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
