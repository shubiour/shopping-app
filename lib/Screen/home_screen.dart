import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/Screen/product_detail_screen.dart';
import 'package:shopping_app/Widget/app_bar.dart';
import '../Controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());

  HomeScreen({super.key});

  Future<void> _refreshProducts() async {
    await _homeController.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBarWidget(
        title: "Products",
        cartNav: true,
        needSorting: true,
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
                  onChanged: _homeController.searchProducts,
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                  () {
                    if (_homeController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                        ),
                        itemCount: _homeController.filteredProducts.length,
                        itemBuilder: (context, index) {
                          final product =
                              _homeController.filteredProducts[index];
                          return GestureDetector(
                            onTap: () {
                              Get.to(ProductDetailsScreen(product: product));
                            },
                            child: GridTile(
                              footer: GridTileBar(
                                backgroundColor: Colors.black45,
                                title: Text(product.title),
                                subtitle: Text(
                                    '\$${product.price.toStringAsFixed(2)}'),
                              ),
                              child: Image.network(product.image,
                                  fit: BoxFit.cover),
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
