// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';
import '../Model/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeController extends GetxController {
  RxList<Product> products = RxList<Product>([]);
  RxList<Product> filteredProducts = RxList<Product>([]);
  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;

      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        final List<Product> fetchedProducts =
            responseData.map((data) => Product.fromJson(data)).toList();

        products.value = fetchedProducts;
        filteredProducts.value = fetchedProducts;
      } else {
        // Handle error case
      }
    } catch (error) {
      // Handle exception
    } finally {
      isLoading.value = false;
    }
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      filteredProducts.value = products;
    } else {
      final lowerCaseQuery = query.toLowerCase();
      final filteredList = products
          .where(
              (product) => product.title.toLowerCase().contains(lowerCaseQuery))
          .toList();
      filteredProducts.value = filteredList;
    }
  }

  void sortProducts(SortOption sortOption) {
    switch (sortOption) {
      case SortOption.highToLow:
        filteredProducts.value = List.from(filteredProducts.value)
          ..sort((a, b) => b.price.compareTo(a.price));
        break;
      case SortOption.lowToHigh:
        filteredProducts.value = List.from(filteredProducts.value)
          ..sort((a, b) => a.price.compareTo(b.price));
        break;
    }
  }
}

enum SortOption {
  highToLow,
  lowToHigh,
}
