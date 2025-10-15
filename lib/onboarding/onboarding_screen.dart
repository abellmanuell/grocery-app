import 'package:flutter/material.dart';
import 'package:grocery_app/home_page.dart';
import 'package:grocery_app/onboarding/image_container.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currentPage = 0;
  static const int totalPages = 3;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onNextTap() {
    if (currentPage == totalPages - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } else {
      controller.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onPreviousTap() {
    if (currentPage > 0) {
      controller.previousPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 150.0),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
          children: [
            buildImageContainer(
              "assets/images/onboarding/home.png",
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
              Text.rich(
                TextSpan(
                  text: "Explore Our ",
                  children: [
                    TextSpan(
                      text: "Vast Grocery",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const TextSpan(text: " Products We Offer"),
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
            buildImageContainer(
              "assets/images/onboarding/product-page.png",
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
              Text.rich(
                TextSpan(
                  text: "Build",
                  children: [
                    TextSpan(
                      text: " Your Exclusive",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const TextSpan(text: " Favourites List"),
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
            buildImageContainer(
              "assets/images/onboarding/best-deal.png",
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
              Text.rich(
                TextSpan(
                  text: "Experience Seamless\n",
                  children: [
                    TextSpan(
                      text: "Delivery Monitoring",
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
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: _onPreviousTap,
              child: currentPage == 0
                  ? const SizedBox.shrink()
                  : Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
            ),

            // Page indicator
            Center(
              child: SmoothPageIndicator(
                effect: WormEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  dotColor: const Color.fromRGBO(204, 237, 225, 1),
                  activeDotColor: Theme.of(context).colorScheme.primary,
                ),
                controller: controller,
                count: totalPages,
              ),
            ),

            // Next button: on last page navigate to Home
            GestureDetector(
              onTap: _onNextTap,
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  currentPage == totalPages - 1
                      ? Icons.check
                      : Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
