import 'package:flutter/material.dart';
import 'package:taller_trapillo_store/theme/app_colors.dart';

import '../../../l10n/generated/app_localizations.dart';

class PromotionsSection extends StatelessWidget {
  const PromotionsSection({super.key});

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
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              PromoCard(text: '20% Bolso Lucia', imagePath: 'assets/images/bolso_1.png'),
              PromoCard(text: 'Envío gratis  \$50', imagePath: 'assets/images/bolso_2.png'),
            ],
          ),
        ),
      ],
    );
  }
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
