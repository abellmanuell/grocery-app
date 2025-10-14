import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String imageUrl;
  final String title;

  const CategoryItem({super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 67,
          width: 67,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(234, 248, 242, 1),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Image.asset(imageUrl, height: 30),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
