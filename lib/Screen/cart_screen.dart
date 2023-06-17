import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/cart_item_controller.dart';

class CartScreen extends StatelessWidget {
  final CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.cartItems.length,
          itemBuilder: (context, index) {
            final cartItem = controller.cartItems[index];
            return ListTile(
              title: Text(cartItem.product.title),
              subtitle: Text('\$${cartItem.product.price.toStringAsFixed(2)}'),
              leading: Image.network(cartItem.product.image),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Remove the cart item
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
