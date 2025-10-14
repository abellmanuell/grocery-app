import 'package:flutter/material.dart';

class ProductCardVertical extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int size;
  final double price;
  final double oldPrice;

  const ProductCardVertical({
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
        color: const Color.fromRGBO(255, 255, 255, 1),
        boxShadow: [
          const BoxShadow(
            color: Color.fromARGB(67, 217, 217, 217),
            offset: Offset(2, 2),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
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
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border_rounded,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(title, style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 3),
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
                          color: Theme.of(context).colorScheme.secondary,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},

                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Add", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
