import 'package:flutter/material.dart';
import 'package:shopping_app/Model/product.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(product.image),
            Text(product.title),
            Text('\$${product.price.toStringAsFixed(2)}'),
            ElevatedButton(
              onPressed: () {
                // Add the product to the cart
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
