import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopping_app/Screen/cart_screen.dart';
import 'package:shopping_app/Screen/home_screen.dart';

class TabScreen extends StatelessWidget {
  TabScreen({super.key});
  final RxInt _selectedPageIndex = 0.obs;
  final List<Widget> _pages = [
    const HomeScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: Obx(() => _pages[_selectedPageIndex.value]),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: _selectedPageIndex.value,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Theme.of(context).primaryColor,
            onTap: (index) => _selectedPageIndex.value = index,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
