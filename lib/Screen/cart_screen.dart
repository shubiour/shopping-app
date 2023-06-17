import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/cart_item_controller.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Obx(
        () {
          if (cartController.cartItems.isEmpty) {
            return Center(child: Text('Cart is empty'));
          } else {
            return ListView.builder(
              itemCount: cartController.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartController.cartItems[index];
                return ListTile(
                  leading: Image.network(cartItem.product.image),
                  title: Text(cartItem.product.title),
                  subtitle: Text('\$${cartItem.product.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      cartController.removeItemFromCart(cartItem);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

