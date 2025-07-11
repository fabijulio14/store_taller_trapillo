import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String name,
    required String description,
    required String image,
    required double price,
    double? promoPrice,
    @Default(false) bool featured,
    required String category,
    @Default(false) bool isFavorite,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  factory Product.fromJsonCustom(Map<String, dynamic> json) {
    final modifiedJson = Map<String, dynamic>.from(json);
    if (modifiedJson.containsKey('promo_price')) {
      modifiedJson['promoPrice'] = modifiedJson.remove('promo_price');
    }
    return _$ProductFromJson(modifiedJson);
  }
}
