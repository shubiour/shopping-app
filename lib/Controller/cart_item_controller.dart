import 'package:get/get.dart';
import '../Model/cart_item.dart';

class CartController extends GetxController {
  RxList<CartItem> cartItems = RxList<CartItem>([]);

  int get cartItemCount => cartItems.length;

  double get totalPrice {
    return cartItems.fold(0, (double sum, CartItem cartItem) {
      return sum + (cartItem.product.price * cartItem.quantity);
    });
  }

  void addItemToCart(CartItem cartItem) {
    cartItems.add(cartItem);
  }

  void removeItemFromCart(CartItem cartItem) {
    cartItems.remove(cartItem);
  }

  void clearCart() {
    cartItems.clear();
  }
}

