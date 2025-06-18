import 'package:flutter/material.dart';
import 'package:taller_trapillo_store/theme/app_colors.dart';

import '../../../data/models/product_model.dart';
import '../../../data/repository/product_repository.dart';
import '../../../l10n/generated/app_localizations.dart';
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
    AppLocalizations localizations = AppLocalizations.of(context)!;

    final categories = [
      localizations.category_handbags,
      localizations.category_baskets,
      localizations.category_accessories,
    ];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Wrap(
        spacing: 8,
        children: List.generate(categories.length, (index) {
          final cat = categories[index];
          return ChoiceChip(
            backgroundColor: AppColors.rose,
            label: Text(cat),
            selected: selectedIndex == index,
            onSelected: (selected) {
              _getProducts().then((products) {
                Navigator.push(
                  // ignore: use_build_context_synchronously
                  context,
                  MaterialPageRoute(builder: (context) => ProductList(productsList: products)),
                );
              });
            },
          );
        }),
      ),
    );
  }
}

Future<List<Product>> _getProducts() async {
  // Llama al repository para obtener productos
  final productRepository = ProductRepository();
  final List<Product> products = await productRepository.getProduct();
  return products;
}
