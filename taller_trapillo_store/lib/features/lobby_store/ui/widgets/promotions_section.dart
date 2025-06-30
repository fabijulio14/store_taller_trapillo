import 'package:flutter/material.dart';
import 'package:taller_trapillo_store/features/lobby_store/data/models/product_model.dart';
import 'package:taller_trapillo_store/core/features/app_colors.dart';

import '../../../../commons/widgets/product_detail.dart';
import '../../../../l10n/generated/app_localizations.dart';

class PromotionsSection extends StatelessWidget {
  final List<Product> productsPromo;

  const PromotionsSection(this.productsPromo, {super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(localizations.promotions, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productsPromo.where((product) => product.promoPrice != null).length,
            itemBuilder: (context, index) {
              final promoProducts =
                  productsPromo.where((product) => product.promoPrice != null).toList();
              final product = promoProducts[index];
              return InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  _showProductDetail(context, product);
                },
                child: PromoCard(
                  text: '${product.name} - \$${product.promoPrice}',
                  imagePath: product.image,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

void _showProductDetail(BuildContext context, Product product) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    builder: (context) => ProductDetail(product: product),
  );
}

class PromoCard extends StatelessWidget {
  final String text;
  final String imagePath;

  const PromoCard({super.key, required this.text, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [AppColors.textPrimary, Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Text(text, style: TextStyle(color: AppColors.white)),
      ),
    );
  }
}
