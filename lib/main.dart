import 'package:flutter/material.dart';
import 'welcome.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudyBuddy',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color.fromARGB(255, 2, 55, 109),
        scaffoldBackgroundColor: const Color.fromARGB(255, 2, 55, 109),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 2, 55, 109),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const WelcomeScreen(), // Launch splash first
      routes: {'/home': (context) => const HomeScreen()},
    );
  }
}
