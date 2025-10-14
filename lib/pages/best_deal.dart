import 'package:flutter/material.dart';
import 'package:grocery_app/global_variables.dart';
import 'package:grocery_app/pages/product_page.dart';
import 'package:grocery_app/widgets/product_card_vertical.dart';

class BestDeal extends StatelessWidget {
  const BestDeal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color.fromRGBO(242, 242, 242, 1)),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        title: const Text("Best Deal"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              crossAxisCount: 2,
              childAspectRatio: 0.78,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ProductPage(
                          imageUrl: product["imageUrl"] as String,
                          title: product["title"] as String,
                          category: product["category"] as String,
                          size: product["size"] as int,
                          price: product["price"] as double,
                        );
                      },
                    ),
                  );
                },
                child: ProductCardVertical(
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
