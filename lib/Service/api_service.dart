import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/product.dart';

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';

  Future<List> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      return responseData.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
