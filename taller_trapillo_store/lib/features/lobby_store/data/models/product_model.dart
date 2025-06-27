class Product {
  final int id;
  final String name;
  final String description;
  final String image;
  final double price;
  final double? promoPrice;
  final bool featured;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    this.promoPrice,
    this.featured = false,
    required this.category,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    // crea un producto a partir de un mapa
    return Product(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      image: map['image'],
      price: (map['price'] as num).toDouble(),
      promoPrice: map['promo_price'] != null ? (map['promo_price'] as num).toDouble() : null,
      featured: map['featured'] ?? false,
      category: map['category'],
    );
  }

  Map<String, dynamic> toMap() {
    // convierte un producto a un mapa
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'price': price,
      'promo_price': promoPrice,
      'featured': featured,
      'category': category,
    };
  }
}
