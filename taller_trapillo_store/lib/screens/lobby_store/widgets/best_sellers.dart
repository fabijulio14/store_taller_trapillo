import 'package:flutter/material.dart';

class BestSellersSection extends StatelessWidget {
  const BestSellersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bestSellers = [
      {'label': 'Bolso Lucia', 'image': 'assets/images/bolso_1.png'},
      {'label': 'Bolso Leila', 'image': 'assets/images/bolso_2.png'},
      {'label': 'Alfombra Rosa', 'image': 'assets/images/alfombra_1.png'},
      {'label': 'Cesto Rosa', 'image': 'assets/images/cesto_1.png'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24),
        Text('Lo más vendido', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: bestSellers.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final item = bestSellers[index];
            return Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(item['image']!, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 4),
                Text(item['label']!),
              ],
            );
          },
        ),
      ],
    );
  }
}
