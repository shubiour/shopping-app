import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/Model/product.dart';
import '../Controller/cart_item_controller.dart';
import '../Model/cart_item.dart';
import '../Widget/app_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen({required this.product});
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(
        title: "Product information",
        cartNav: true,
        needSorting: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(product.image),
            Text(product.title),
            Text('\$${product.price.toStringAsFixed(2)}'),
            ElevatedButton(
              onPressed: () {
                final cartItem = CartItem(product: product, quantity: 1);
                cartController.addItemToCart(cartItem);
                Get.snackbar('Success', 'Item added to cart');
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
