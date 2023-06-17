import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller/cart_item_controller.dart';
import 'Controller/home_controller.dart';
import 'Router/app_routes.dart';

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
      getPages: AppRoutes.routes,
    );
  }
}
