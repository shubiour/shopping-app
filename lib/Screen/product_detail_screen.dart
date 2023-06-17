import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/Model/product.dart';
import '../Controller/cart_item_controller.dart';
import '../Model/cart_item.dart';
import '../Widget/app_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen({super.key, required this.product});
  final CartController _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBarWidget(
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
                _cartController.addItemToCart(cartItem);
                Get.snackbar('Success', 'Item added to cart');
              },
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
