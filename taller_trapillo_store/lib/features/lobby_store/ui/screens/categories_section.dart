import 'package:flutter/material.dart';
import 'package:taller_trapillo_store/features/lobby_store/data/models/product_model.dart';
import 'package:taller_trapillo_store/core/features/app_colors.dart';

import '../../../../l10n/generated/app_localizations.dart';
import 'product_list_screen.dart';

class CategoriesSection extends StatefulWidget {
  final List<Product> products;
  const CategoriesSection({super.key, required this.products});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    final categories = [
      {'id': 1, 'name': localizations.category_handbags},
      {'id': 2, 'name': localizations.category_baskets},
      {'id': 3, 'name': localizations.category_accessories},
    ];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Wrap(
        spacing: 8,
        children: List.generate(categories.length, (index) {
          final cat = categories[index];
          return ChoiceChip(
            backgroundColor: AppColors.rose,
            label: Text(cat['name'] as String),
            selected: false,
            onSelected: (selected) {
              setState(() {
                selectedIndex = index;
              });
              final filteredProducts = filterProductsByCategory(widget.products, cat['id'] as int);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => ProductListView(
                        productsList: filteredProducts,
                        title: cat['name'] as String,
                      ),
                ),
              );
            },
          );
        }),
      ),
    );
  }

  List<Product> filterProductsByCategory(List<Product> products, int category) {
    final filtered = products.where((product) => product.category == category).toList();
    return filtered;
  }
}
