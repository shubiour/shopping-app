import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/Screen/cart_screen.dart';
import 'package:shopping_app/Screen/home_screen.dart';
import 'Controller/cart_item_controller.dart';
import 'Controller/home_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Product App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/cart', page: () => CartScreen()),
      ],
    );
  }
}
