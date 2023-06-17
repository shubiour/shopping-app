import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/cart_item_controller.dart';
import '../Screen/cart_screen.dart';

class SAppBar extends StatelessWidget implements PreferredSizeWidget {
  final CartController cartController = Get.find<CartController>();
  final String title;
  final bool cartNav;

  SAppBar({
    super.key,
    required this.title,
    required this.cartNav,
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
                            '${cartController.cartItemCount}',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                ],
              )
            : const Offstage(),
      ],
    );
  }
}
