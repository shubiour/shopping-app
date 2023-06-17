import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../Model/product.dart';
import '../Service/api_service.dart';

class HomeController extends GetxController {
  RxList<Product> products = RxList<Product>([]);
  RxList<Product> filteredProducts = RxList<Product>([]);

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      final List<Product> fetchedProducts = await ApiService.fetchProducts();
      products.assignAll(fetchedProducts);
      filteredProducts.assignAll(fetchedProducts);
    } catch (e) {
      // Handle error
    }
  }

  void searchProducts(String query) {
    filteredProducts.value = products.where((product) =>
        product.title.toLowerCase().contains(query.toLowerCase())).toList();
  }
}


