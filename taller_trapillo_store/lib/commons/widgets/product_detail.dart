import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taller_trapillo_store/l10n/generated/app_localizations.dart';

import '../../core/features/app_colors.dart';
import '../../features/lobby_store/data/models/product_model.dart';
import '../../features/lobby_store/data/providers/get_products_provider.dart';

class ProductDetailSheet extends ConsumerWidget {
  final Product product;

  const ProductDetailSheet({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productListNotifier = ref.read(productListProvider.notifier);

    AppLocalizations localizations = AppLocalizations.of(context)!;

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
                      productListNotifier.isFavorite(product.id)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color:
                          productListNotifier.isFavorite(product.id)
                              ? AppColors.primary
                              : AppColors.textPrimary,
                    ),
                    onPressed: () {
                      productListNotifier.toggleFavorite(product.id);
                    },
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(product.description, style: TextStyle(fontSize: 16)),
              SizedBox(height: 12),
              Text(
                '\$${product.price}',
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
