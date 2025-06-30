// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_products_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productListHash() => r'96a84dbb4239df429a4acf3d8e0790a9d16359d0';

/// See also [ProductList].
@ProviderFor(ProductList)
final productListProvider = AutoDisposeAsyncNotifierProvider<ProductList, List<Product>>.internal(
  ProductList.new,
  name: r'productListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$productListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductList = AutoDisposeAsyncNotifier<List<Product>>;
String _$favoritesListHash() => r'd55789ebf6815e9244c970b58877ccaedcbfc7d2';

/// See also [FavoritesList].
@ProviderFor(FavoritesList)
final favoritesListProvider = AutoDisposeNotifierProvider<FavoritesList, List<Product>>.internal(
  FavoritesList.new,
  name: r'favoritesListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$favoritesListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FavoritesList = AutoDisposeNotifier<List<Product>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
