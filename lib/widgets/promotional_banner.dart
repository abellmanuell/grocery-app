import 'package:flutter/material.dart';

class PromotionalBanner extends StatelessWidget {
  const PromotionalBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(230, 247, 240, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Up to 30% offer!",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Enjoy our big offer of\nevery day",
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(height: 15),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  shadowColor: const Color.fromARGB(83, 1, 172, 101),
                  minimumSize: const Size(100, 38),
                  backgroundColor: Theme.of(context).colorScheme.primary,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Shop Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Image.asset("assets/images/shopping-basket.png", height: 130),
        ],
      ),
    );
  }
}
