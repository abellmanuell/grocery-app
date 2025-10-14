import 'package:flutter/material.dart';

class ProductCardHorizontal extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int size;
  final double price;
  final double oldPrice;

  const ProductCardHorizontal({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidthSize = MediaQuery.of(context).size.width;

    return Container(
      // height: 140,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(255, 255, 255, 1),
        boxShadow: [
          const BoxShadow(
            color: Color.fromARGB(67, 217, 217, 217),
            offset: Offset(2, 2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    padding: screenWidthSize < 764
                        ? null
                        : const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(246, 246, 246, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      imageUrl,
                      height: screenWidthSize < 764 ? 120 : 180,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        child: const Text(
                          "35% OFF",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(title, style: Theme.of(context).textTheme.titleSmall),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$size Kg",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          const SizedBox(height: 3),

                          Row(
                            children: [
                              Text(
                                "\$${price.toStringAsFixed(0)}",
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "\$${oldPrice.toStringAsFixed(0)}",
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
