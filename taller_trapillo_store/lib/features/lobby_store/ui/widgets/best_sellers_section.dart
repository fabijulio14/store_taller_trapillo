import 'package:flutter/material.dart';

import '../../../../commons/widgets/product_detail.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../data/models/product_model.dart';

class BestSellersSection extends StatelessWidget {
  final List<Product> productsBestSellers;

  const BestSellersSection(this.productsBestSellers, {super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24),
        Text(
          localizations.txt_best_sellers,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: productsBestSellers.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final item = productsBestSellers[index];
            return InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                _showProductDetail(context, item);
              },
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(item.image, fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(item.name),
                ],
              ),
            );
          },
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
