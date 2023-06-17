import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product App'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final product = controller.products[index];
            return ListTile(
              title: Text(product.title),
              subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
              leading: Image.network(product.image),
              onTap: () {
                // Navigate to product details page
              },
            );
          },
        ),
      ),
    );
  }
}