import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/onboarding/image_container.dart';
import 'package:grocery_app/onboarding/onboarding_screen.dart';

class OnboardingFirstScreen extends StatefulWidget {
  const OnboardingFirstScreen({super.key});

  @override
  State<OnboardingFirstScreen> createState() => OnboardingFirstScreenState();
}

class OnboardingFirstScreenState extends State<OnboardingFirstScreen> {
  final controller = PageController();
  bool isFirstPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 150.0),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            isFirstPage = index == 0;
          },
          children: [
            buildImageContainer(
              imageHeight: 440,
              "assets/images/onboarding/lady-and-cabbage.png",
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
              Text.rich(
                TextSpan(
                  text: "Let's find the ",
                  children: [
                    TextSpan(
                      text: "Best",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const TextSpan(text: " & "),
                    TextSpan(
                      text: "Healthy Grocery",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                strutStyle: const StrutStyle(
                  leading: 1.2,
                  forceStrutHeight: true,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 200,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 30),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const OnboardingScreen();
                      },
                    ),
                  );
                },
                label: const Text(
                  "Let's Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
            Text.rich(
              TextSpan(
                text: 'Already have an account? ',
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    text: "Sign In",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationColor: Theme.of(context).colorScheme.primary,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
