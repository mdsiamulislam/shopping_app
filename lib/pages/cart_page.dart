import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../date/cart_product.dart';
import '../date/product_list.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double total = 0.0;

  @override
  void initState() {
    super.initState();
    _calculateTotal();
  }

  void _calculateTotal() {
    total = cartProduct.fold(0, (sum, index) {
      final cartItem = shoes[index];
      return sum + (cartItem['price'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: cartProduct.length,
        itemBuilder: (context, index) {
          final cartItem = shoes[cartProduct[index]];

          return Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          cartItem['title'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Text(
                        '\$${cartItem['price'].toStringAsFixed(2)}',
                        softWrap: true,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    cartItem['image'],
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  IconButton(
                    icon: const Icon(CupertinoIcons.delete),
                    onPressed: () {
                      setState(() {
                        cartProduct.removeAt(index);
                        _calculateTotal(); // Recalculate total after removal
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        color: const Color.fromRGBO(254, 206, 1, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: \$${total.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Your order has been Completed!'),
                    duration: const Duration(seconds: 2),
                    backgroundColor: Colors.green,
                  ),
                );
                setState(() {
                  cartProduct.clear();
                  total = 0.0;
                });
              },
              child: const Text(
                'Checkout',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
