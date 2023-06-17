import 'package:get/get.dart';
import 'package:shopping_app/Screen/home_screen.dart';
import '../Screen/cart_screen.dart';
class AppRoutes {
  static final List<GetPage> routes = [
    GetPage(name: '/', page: () => HomeScreen()),
    GetPage(name: '/cart', page: () => CartScreen()),
  ];
}
