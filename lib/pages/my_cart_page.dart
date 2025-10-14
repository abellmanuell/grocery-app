import 'package:flutter/material.dart';
import 'package:grocery_app/global_variables.dart';
import 'package:grocery_app/widgets/product_card_horizontal.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shopping Cart")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return Dismissible(
                key: Key("$index"),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(250, 215, 217, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    size: 32,
                    Icons.delete,
                    color: Color.fromRGBO(232, 74, 76, 1),
                  ),
                ),
                onDismissed: (direction) {
                  /* setState(() {
                    items.removeAt(index);
                  }); */

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("$product deleted")));
                },
                child: ProductCardHorizontal(
                  imageUrl: product["imageUrl"] as String,
                  title: product["title"] as String,
                  price: product["price"] as double,
                  oldPrice: product["old_price"] as double,
                  size: product["size"] as int,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
