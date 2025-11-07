// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> gridItems = const [
    {'icon': Icons.person, 'label': 'Profile', 'color': Colors.teal},
    {'icon': Icons.alarm, 'label': 'Reminders', 'color': Colors.orange},
    {'icon': Icons.assignment, 'label': 'Assignments', 'color': Colors.purple},
    {'icon': Icons.chat, 'label': 'AI Chat', 'color': Colors.green},
    {'icon': Icons.school, 'label': 'Courses', 'color': Colors.red},
    {'icon': Icons.book, 'label': 'Notes', 'color': Colors.cyan},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900], // Dark navy background
      appBar: AppBar(
        title: const Text('StudyBuddy'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: gridItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 icons per row
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // TODO: Replace with navigation to respective screen
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${gridItems[index]['label']} clicked'),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: (gridItems[index]['color'] as Color).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      gridItems[index]['icon'] as IconData,
                      size: 50,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      gridItems[index]['label'] as String,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
