import 'package:flutter/material.dart';

class SearchBarItem extends StatelessWidget {
  const SearchBarItem({super.key});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 2,
        color: Color.fromRGBO(242, 242, 242, 1),
      ),
    );

    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              focusedBorder: border,
              enabledBorder: border,
              prefixIcon: Icon(
                Icons.search_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 30,
              ),
              hintText: "Search Food, Drinks, etc",
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        IconButton.filled(
          onPressed: () {},
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: const Size(50, 50),
          ),
          icon: const Icon(Icons.filter_list_rounded, size: 30),
        ),
      ],
    );
  }
}
