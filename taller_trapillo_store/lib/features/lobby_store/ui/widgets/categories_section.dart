import 'package:flutter/material.dart';
import 'package:taller_trapillo_store/features/lobby_store/data/models/product_model.dart';
import 'package:taller_trapillo_store/core/features/app_colors.dart';

import '../../../../l10n/generated/app_localizations.dart';
import '../../../../commons/widgets/products_list.dart';

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
      {'id': 'handbags'},
      {'id': 'baskets'},
      {'id': 'accessories'},
    ];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Wrap(
        spacing: 8,
        children: List.generate(categories.length, (index) {
          final cat = categories[index];
          final categoryName = getCategoryName(cat['id'] as String, localizations);
          return ChoiceChip(
            backgroundColor: AppColors.rose,
            label: Text(categoryName),
            selected: false,
            onSelected: (selected) {
              setState(() {
                selectedIndex = index;
              });
              final filteredProducts = filterProductsByCategory(
                widget.products,
                cat['id'] as String,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          ProductsList(productsList: filteredProducts, title: categoryName),
                ),
              );
            },
          );
        }),
      ),
    );
  }

  List<Product> filterProductsByCategory(List<Product> products, String category) {
    final filtered = products.where((product) => product.category == category).toList();
    return filtered;
  }

  String getCategoryName(String categoryId, AppLocalizations localizations) {
    switch (categoryId) {
      case 'handbags':
        return localizations.category_handbags;
      case 'baskets':
        return localizations.category_baskets;
      case 'accessories':
        return localizations.category_accessories;
      default:
        return categoryId;
    }
  }
}
