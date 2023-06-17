import 'package:get/get.dart';
import 'package:shopping_app/Screen/home_screen.dart';
import '../Screen/cart_screen.dart';
import './route_constants.dart';
import '../Screen/tab_screen.dart';

class AppRoutes {
  static final List<GetPage> routes = [
    GetPage(name: tabScreen, page: () => TabScreen()),
    GetPage(name: cartScreen, page: () => CartScreen()),
    GetPage(name: home, page: () => HomeScreen()),
  ];
}
