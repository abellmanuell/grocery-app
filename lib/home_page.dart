import 'package:flutter/material.dart';
import 'package:grocery_app/pages/my_cart_page.dart';
import 'package:grocery_app/pages/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = const [ProductList(), MyCartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentPage, children: pages),
      bottomNavigationBar: SafeArea(
        bottom: false,
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: currentPage,
          iconSize: 28,
          selectedLabelStyle: const TextStyle(fontSize: 10),
          unselectedFontSize: 10,
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: "My Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded),
              label: "Favourite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.door_back_door),
              label: "My Order",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_3),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
