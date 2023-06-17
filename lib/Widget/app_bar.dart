import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/cart_item_controller.dart';
import '../Controller/home_controller.dart';
import '../Screen/cart_screen.dart';

class SAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
final HomeController _homeController = Get.put(HomeController());
  final CartController _cartController = Get.put(CartController());
  final String title;
  final bool cartNav;
  final bool needSorting;

  SAppBarWidget({
    super.key,
    required this.title,
    required this.cartNav,
    required this.needSorting,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Product App'),
      actions: [
        cartNav
            ? Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Get.to(CartScreen());
                    },
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Obx(() => Text(
                            '${_cartController.cartItemCount}',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                ],
              )
            : const Offstage(),
        needSorting
            ? PopupMenuButton<SortOption>(
                icon: Icon(Icons.sort),
                onSelected: (SortOption selectedOption) {
                  _homeController.sortProducts(selectedOption);
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem<SortOption>(
                    value: SortOption.highToLow,
                    child: Text('High to Low'),
                  ),
                  PopupMenuItem<SortOption>(
                    value: SortOption.lowToHigh,
                    child: Text('Low to High'),
                  ),
                ],
              )
            : const Offstage(),
      ],
    );
  }
}
