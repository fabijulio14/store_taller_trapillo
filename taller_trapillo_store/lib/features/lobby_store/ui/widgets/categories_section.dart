import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taller_trapillo_store/features/lobby_store/data/models/product_model.dart';
import 'package:taller_trapillo_store/core/features/app_colors.dart';

import '../../../../l10n/generated/app_localizations.dart';
import '../../../../commons/widgets/products_list.dart';
import '../view_models/get_products_view_model.dart';

class CategoriesSection extends ConsumerStatefulWidget {
  final List<Product> products;
  const CategoriesSection({super.key, required this.products});

  @override
  ConsumerState<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends ConsumerState<CategoriesSection> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    final filterViewModel = ref.read(productListViewModelProvider.notifier);

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
          final categoryName = filterViewModel.getCategoryName(cat['id'] as String, localizations);
          return ChoiceChip(
            backgroundColor: AppColors.rose,
            label: Text(categoryName),
            selected: false,
            onSelected: (selected) {
              setState(() {
                selectedIndex = index;
              });
              final filteredProducts = filterViewModel.filterProductsByCategory(
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
}
