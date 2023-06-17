import 'package:get/get.dart';
import '../Model/cart_item.dart';
import 'package:get/get.dart';
import '../Model/cart_item.dart';

class CartController extends GetxController {
  RxList<CartItem> cartItems = RxList<CartItem>([]);

  // Get the total number of items in the cart
  int get cartItemCount => cartItems.length;

  // Get the total price of all items in the cart
  double get totalPrice {
    return cartItems.fold(0, (double sum, CartItem cartItem) {
      return sum + (cartItem.product.price * cartItem.quantity);
    });
  }

  // Add an item to the cart
  void addItemToCart(CartItem cartItem) {
    cartItems.add(cartItem);
  }

  // Remove an item from the cart
  void removeItemFromCart(CartItem cartItem) {
    cartItems.remove(cartItem);
  }

  // Clear all items from the cart
  void clearCart() {
    cartItems.clear();
  }
}

