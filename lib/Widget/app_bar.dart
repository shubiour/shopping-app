import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/Router/route_constants.dart';
import '../Controller/cart_item_controller.dart';
import '../Controller/home_controller.dart';

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
      title: Text(title),
      actions: [
        cartNav
            ? Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Get.toNamed(cartScreen);
                    },
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Obx(() => Text(
                            '${_cartController.cartItemCount}',
                            style: const TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                ],
              )
            : const Offstage(),
        needSorting
            ? PopupMenuButton<SortOption>(
                icon: const Icon(Icons.sort),
                onSelected: (SortOption selectedOption) {
                  _homeController.sortProducts(selectedOption);
                },
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem<SortOption>(
                    value: SortOption.highToLow,
                    child: Text('High to Low'),
                  ),
                  const PopupMenuItem<SortOption>(
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
