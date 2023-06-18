// ignore_for_file: invalid_use_of_protected_member
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../Model/product.dart';
import '../Service/api_service.dart';

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
      final List<Product> fetchedProducts = await ApiService.fetchProducts();
      products.value = fetchedProducts;
      filteredProducts.value = fetchedProducts;
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshProducts() async {
    await fetchProducts();
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
