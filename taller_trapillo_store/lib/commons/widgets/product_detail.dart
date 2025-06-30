import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taller_trapillo_store/l10n/generated/app_localizations.dart';

import '../../core/features/app_colors.dart';
import '../../features/lobby_store/data/models/product_model.dart';
import '../../features/lobby_store/ui/view_models/get_products_view_model.dart';

class ProductDetail extends ConsumerWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    final isFavorite = ref.watch(
      favoritesListProvider.select((favorites) => favorites.any((p) => p.id == product.id)),
    );

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    product.image,
                    height: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(color: Colors.grey[200], height: 150),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text(product.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? AppColors.primary : AppColors.textPrimary,
                    ),
                    onPressed: () {
                      final notifier = ref.read(favoritesListProvider.notifier);
                      if (isFavorite) {
                        notifier.removeFavorite(product);
                      } else {
                        notifier.addFavorite(product);
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(product.description, style: TextStyle(fontSize: 16)),
              SizedBox(height: 12),
              Text(
                NumberFormat.simpleCurrency(
                  locale: Localizations.localeOf(context).toString(),
                ).format(product.price),
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Acción al presionar el botón de comprar
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  minimumSize: Size(double.infinity, 30),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  localizations.txt_add_cart,
                  style: TextStyle(fontSize: 16, color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
            tooltip: 'Cerrar',
          ),
        ),
      ],
    );
  }
}
