import 'package:flutter/material.dart';
import 'package:grocery_app/global_variables.dart';
import 'package:grocery_app/widgets/category_item.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
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
        ),
        title: const Text("Category"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.8,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return CategoryItem(
              imageUrl: category["imageUrl"] as String,
              title: category["title"] as String,
            );
          },
        ),
      ),
    );
  }
}
