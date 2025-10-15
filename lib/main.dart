import 'package:flutter/material.dart';
import 'package:grocery_app/onboarding/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarThemeData(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(fontSize: 18, color: Colors.black),
          centerTitle: true,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(1, 172, 102, 1),
          primary: const Color.fromRGBO(1, 172, 102, 1),
          secondary: const Color.fromRGBO(140, 140, 140, 1),
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          titleSmall: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        fontFamily: 'Inter',
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const OnboardingFirstScreen(),
    );
  }
}
