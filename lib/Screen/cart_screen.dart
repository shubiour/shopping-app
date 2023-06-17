import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/cart_item_controller.dart';
import '../Widget/app_bar.dart';
class CartScreen extends StatelessWidget {
  final CartController _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBarWidget(
        title: "Cart",
        cartNav: false,
        needSorting: false,
      ),
      body: Obx(
        () {
          if (_cartController.cartItems.isEmpty) {
            return Center(child: Text('Cart is empty'));
          } else {
            return ListView.builder(
              itemCount: _cartController.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = _cartController.cartItems[index];
                return ListTile(
                  leading: Image.network(cartItem.product.image),
                  title: Text(cartItem.product.title),
                  subtitle:
                      Text('\$${cartItem.product.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _cartController.removeItemFromCart(cartItem);
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
