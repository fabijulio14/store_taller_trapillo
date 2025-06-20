import 'package:flutter/material.dart';

import '../../../data/models/product_model.dart';
import '../../../l10n/generated/app_localizations.dart';

class BestSellersSection extends StatelessWidget {
  final List<Product> productsBestSellers;

  const BestSellersSection(this.productsBestSellers, {super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    // final bestSellers = [
    //   {'label': 'Bolso Lucia', 'image': 'assets/images/bolso_1.png'},
    //   {'label': 'Bolso Leila', 'image': 'assets/images/bolso_2.png'},
    //   {'label': 'Alfombra Rosa', 'image': 'assets/images/alfombra_1.png'},
    //   {'label': 'Cesto Rosa', 'image': 'assets/images/cesto_1.png'},
    // ];

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
            return Column(
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
            );
          },
        ),
      ],
    );
  }
}
