import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/Screen/cart_screen.dart';
import 'package:shopping_app/Screen/product_detail_screen.dart';
import '../Controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product App'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to(CartScreen());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextField(
                onChanged: controller.searchProducts,
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
                  if (controller.filteredProducts.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      itemCount: controller.filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = controller.filteredProducts[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(ProductDetailsScreen(product: product));
                          },
                          child: GridTile(
                            child:
                                Image.network(product.image, fit: BoxFit.cover),
                            footer: GridTileBar(
                              backgroundColor: Colors.black45,
                              title: Text(product.title),
                              subtitle:
                                  Text('\$${product.price.toStringAsFixed(2)}'),
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
    );
  }
}
