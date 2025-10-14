import 'package:flutter/material.dart';
import 'package:grocery_app/global_variables.dart';
import 'package:grocery_app/pages/best_deal.dart';
import 'package:grocery_app/pages/category_page.dart';
import 'package:grocery_app/pages/product_page.dart';
import 'package:grocery_app/widgets/promotional_banner.dart';
import 'package:grocery_app/widgets/category_item.dart';
import 'package:grocery_app/widgets/product_card_vertical.dart';
import 'package:grocery_app/widgets/search_bar.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidthSize = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            "New York, USA",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    color: Colors.black,
                    style: IconButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.notifications, size: 25),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              const SearchBarItem(),

              const SizedBox(height: 20),
              const PromotionalBanner(),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const CategoryPage();
                          },
                        ),
                      );
                    },
                    style: TextButton.styleFrom(),
                    child: const Text("See All"),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return CategoryItem(
                      imageUrl: category["imageUrl"] as String,
                      title: category["title"] as String,
                    );
                  },
                ),
              ),

              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best Deal",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const BestDeal();
                          },
                        ),
                      );
                    },
                    style: TextButton.styleFrom(),
                    child: const Text("See All"),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  crossAxisCount: 2,
                  childAspectRatio: screenWidthSize < 764 ? 0.78 : 1.3,
                ),
                itemCount: 4,
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
            ],
          ),
        ),
      ),
    );
  }
}
