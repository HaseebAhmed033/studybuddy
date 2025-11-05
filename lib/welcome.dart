import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 55, 109), // dark navy blue
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🖼️ Logo image
            Image.asset(
              'assets/images/logo.png', // make sure path matches pubspec.yaml
              width: 150,
              height: 150,
            ),

            const SizedBox(height: 20),

            // 💬 Text
            const Text(
              "Let's Study....Buddy🤍",

              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
