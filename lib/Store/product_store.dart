import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/product.dart';

class ProductStore {
  Future<void> saveProductsToSharedPreferences(List<Product> products) async {
    final prefs = await SharedPreferences.getInstance();
    final encodedProducts =
        products.map((product) => product.toJson()).toList();
    final encodedString = jsonEncode(encodedProducts);
    await prefs.setString('products', encodedString);
  }

  Future<List<Product>> loadProductsFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedProducts = prefs.getStringList('products');
    if (encodedProducts != null) {
      final products = encodedProducts
          .map((encodedProduct) => Product.fromJson(jsonDecode(encodedProduct)))
          .toList();
      return products;
    }
    return [];
  }
}
