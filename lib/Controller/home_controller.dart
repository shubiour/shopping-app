import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../Model/product.dart';
import '../Service/api_service.dart';

class HomeController extends GetxController {
  RxList<Product> products = RxList<Product>([]);

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      final List<Product> fetchedProducts = await ApiService.fetchProducts();
      products.assignAll(fetchedProducts);
    } catch (e) {
      // Handle error
    }
  }
}

