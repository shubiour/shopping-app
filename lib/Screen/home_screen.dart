import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/Screen/product_detail_screen.dart';
import 'package:shopping_app/Widget/app_bar.dart';
import '../Controller/cart_item_controller.dart';
import '../Controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  final CartController cartController = Get.find<CartController>();

  Future<void> _refreshProducts() async {
    await homeController.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(
        title: "Products",
        cartNav: true,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshProducts,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  onChanged: homeController.searchProducts,
                  decoration: InputDecoration(
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                  () {
                    if (homeController.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                        ),
                        itemCount: homeController.filteredProducts.length,
                        itemBuilder: (context, index) {
                          final product =
                              homeController.filteredProducts[index];
                          return GestureDetector(
                            onTap: () {
                              Get.to(ProductDetailsScreen(product: product));
                            },
                            child: GridTile(
                              child: Image.network(product.image,
                                  fit: BoxFit.cover),
                              footer: GridTileBar(
                                backgroundColor: Colors.black45,
                                title: Text(product.title),
                                subtitle: Text(
                                    '\$${product.price.toStringAsFixed(2)}'),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
