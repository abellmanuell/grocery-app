import 'package:flutter/material.dart';
import 'package:grocery_app/global_variables.dart';
import 'package:grocery_app/pages/review_page.dart';

class ProductPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String category;
  final int size;
  final double price;

  const ProductPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.category,
    required this.size,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidthSize = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
                actionsPadding: const EdgeInsets.only(right: 10),
                floating: true,
                pinned: false,
                leading: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color.fromRGBO(242, 242, 242, 1),
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_outlined),
                ),
                title: const Text("Details"),
                actions: [
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Color.fromRGBO(242, 242, 242, 1),
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.favorite_border_rounded),
                  ),
                ],
              ),

              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 40, bottom: 60),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(246, 246, 246, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      imageUrl,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              category,
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  iconSize: 20,
                                  constraints: const BoxConstraints(),
                                  style: IconButton.styleFrom(
                                    padding: const EdgeInsets.all(2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    backgroundColor: const Color.fromRGBO(
                                      246,
                                      246,
                                      246,
                                      1,
                                    ),
                                  ),
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove),
                                ),

                                Text("$size Kg"),

                                IconButton(
                                  iconSize: 20,
                                  constraints: const BoxConstraints(),
                                  style: IconButton.styleFrom(
                                    padding: const EdgeInsets.all(2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    backgroundColor: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const ReviewPage();
                                },
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Row(
                                children: List.generate(5, (index) {
                                  return Icon(
                                    Icons.star_rounded,
                                    size: 28,
                                    color: index == 4
                                        ? const Color.fromARGB(
                                            228,
                                            238,
                                            238,
                                            238,
                                          )
                                        : const Color.fromRGBO(252, 175, 35, 1),
                                  );
                                }),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "(4.5)",
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          "Product Details",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text.rich(
                          TextSpan(
                            text:
                                "Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus nihil tenetur saepe accusantium dolore neque eius consectetur, vero asperiores et ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            children: [
                              TextSpan(
                                text: "Read more",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Theme.of(
                                    context,
                                  ).colorScheme.primary,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Divider(
                            thickness: 1,
                            color: Color.fromARGB(255, 226, 226, 226),
                          ),
                        ),

                        const SizedBox(height: 10),
                        Text(
                          "More ${category}s",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            screenWidthSize < 764 ? 4 : 8,
                            (index) {
                              final category = categories[index];
                              return Column(
                                children: <Widget>[
                                  Container(
                                    height: 80,
                                    width: 80,
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                        234,
                                        248,
                                        242,
                                        1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.asset(
                                      category["imageUrl"] as String,
                                      height: 30,
                                    ),
                                  ),

                                  const SizedBox(height: 8),
                                  Text(
                                    category["title"] as String,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(236, 236, 236, 1),
                    blurRadius: 10,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Price",
                          style: TextStyle(
                            // fontSize: 12,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        Text(
                          "\$${price.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        // minimumSize: Size(100, 80),
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 62,
                        ),
                        iconSize: 25,
                        elevation: 0,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_bag, color: Colors.white),
                      label: const Text(
                        "Add to Cart",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
