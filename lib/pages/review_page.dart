import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color.fromRGBO(246, 246, 246, 1)),
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
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
        title: const Text("Review"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Center(
                          child: Column(
                            children: [
                              const Text(
                                "4.5",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(5, (index) {
                                  return const Icon(
                                    Icons.star_rounded,
                                    size: 32,
                                    color: Color.fromRGBO(252, 175, 35, 1),
                                  );
                                }),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "(107 Reviews)",
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const Divider(
                        thickness: 1,
                        color: Color.fromRGBO(228, 228, 228, 1),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(246, 246, 246, 1),
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              color: Theme.of(context).colorScheme.primary,
                              size: 30,
                            ),
                            hintText: "Search in reviews",
                            hintStyle: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            enabledBorder: border,
                            focusedBorder: border,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            List<String> filters = [
                              "Verified",
                              "Latest",
                              "Detailed Reviews",
                            ];

                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  backgroundColor: Theme.of(
                                    context,
                                  ).colorScheme.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  filters[index],
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      const Divider(
                        thickness: 1,
                        color: Color.fromRGBO(228, 228, 228, 1),
                      ),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return const ReviewItem(
                            name: "Dale Thiel",
                            review:
                                "Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus nihil tenetur saepe accusantium",
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),
              ],
            ),
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
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20,
                  top: 15,
                  bottom: 25,
                ),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  label: const Text(
                    "Write Review",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewItem extends StatelessWidget {
  final String name;
  final String review;

  const ReviewItem({super.key, required this.name, required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage("assets/images/me.jpg"),
                          ),
                          Positioned(
                            bottom: 0,
                            right: -5,
                            child: Image.asset(
                              height: 18,
                              "assets/images/icons/verified.png",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "11 months ago",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                review,
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  Row(
                    children: List.generate(5, (index) {
                      return const Icon(
                        Icons.star_rounded,
                        size: 28,
                        color: Color.fromRGBO(252, 175, 35, 1),
                      );
                    }),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "5.0",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(thickness: 1, color: Color.fromRGBO(228, 228, 228, 1)),
      ],
    );
  }
}
