import 'package:flutter/material.dart';

Widget buildImageContainer(
  String imagePath,
  String subtitle,
  Widget title, {
  double imageHeight = 600,
}) {
  return Column(
    children: [
      Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(180),
            bottomRight: Radius.circular(180),
          ),
        ),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            ClipRRect(
              child: Image.asset(
                height: 550,
                width: double.infinity,
                "assets/images/onboarding/love-background.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 120,
              left: 0,
              right: 0,
              child: Image.asset(
                height: imageHeight,
                imagePath,
                fit: BoxFit.contain,
              ),
            ),

            Transform.translate(
              offset: const Offset(0, 380),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(0, 195, 195, 195),
                      Color.fromARGB(82, 225, 225, 225),
                    ],
                    stops: [0.0, 0.5], // Optional: control color distribution
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              title,
              const SizedBox(height: 15),

              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color.fromRGBO(140, 140, 140, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
