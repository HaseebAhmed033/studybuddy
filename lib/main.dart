import 'package:flutter/material.dart';
import 'welcome.dart'; // 👈 make sure this matches your file name

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(), // 👈 class name inside welcome.dart
    );
  }
}
