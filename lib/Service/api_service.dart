import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/product.dart';

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<Product> products = data
          .cast<Map<String, dynamic>>()
          .map<Product>((json) => Product.fromJson(json))
          .toList();
      return products;
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
