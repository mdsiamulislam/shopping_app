import 'package:flutter/material.dart';

import '../date/cart_product.dart';
import '../date/product_list.dart';
import 'cart_page.dart';

class ProductPages extends StatelessWidget {
  final int productIndex;

  ProductPages({required this.productIndex});

  @override
  Widget build(BuildContext context) {
    final product = shoes[productIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(product['title']),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },
          ),
        ],
        backgroundColor: const Color.fromRGBO(254, 206, 1, 1),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Image.asset(
                product['image'],
                height: 250,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                product['title'],
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                '\$${product['price'].toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                product['description'],
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(254, 206, 1, 1),
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // No border radius
            ),
          ),
          onPressed: () {
            // Add the product to the cart
            cartProduct.add(productIndex);

            // Show the SnackBar after adding the product to the cart
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text('${product['title']} has been added to the cart.'),
                duration: const Duration(seconds: 2),
                backgroundColor: Colors.green,
              ),
            );
          },
          child: const Text(
            'Add to Cart',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
