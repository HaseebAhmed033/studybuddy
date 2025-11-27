import 'package:flutter/material.dart';
import 'welcome.dart';
import 'home.dart';
import 'profile.dart';
import 'reminders.dart';
import 'aichat.dart';
import 'notes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  runApp(const StudyBuddyApp());
}

class StudyBuddyApp extends StatelessWidget {
  const StudyBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudyBuddy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 2, 55, 109),
        brightness: Brightness.dark,
      ),
      initialRoute: '/', // start route
      routes: {
        '/': (context) => const SplashWrapper(), // splash screen wrapper
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/reminders': (context) => const RemindersPage(),
        '/aichat': (context) => const AiChatPage(),
        '/notes': (context) => const NotesPage(),
      },
    );
  }
}

// 🌟 Splash screen wrapper that auto-navigates to home
class SplashWrapper extends StatefulWidget {
  const SplashWrapper({super.key});

  @override
  State<SplashWrapper> createState() => _SplashWrapperState();
}

class _SplashWrapperState extends State<SplashWrapper> {
  @override
  void initState() {
    super.initState();
    // Delay 3 seconds then navigate to home
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const WelcomeScreen();
  }
}
