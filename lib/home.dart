import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> gridItems = [
      {'title': 'Profile', 'icon': Icons.person},
      {'title': 'Reminders', 'icon': Icons.notifications},
      {'title': 'Notes', 'icon': Icons.note},
      {'title': 'AI Buddy Chat', 'icon': Icons.chat},
      {'title': 'Timetable', 'icon': Icons.calendar_today},
      {'title': 'Quotes of the Day', 'icon': Icons.format_quote},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('StudyBuddy 🤍'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 2, 55, 109),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: gridItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    gridItems[index]['icon'],
                    size: 50,
                    color: Colors.blue[900],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    gridItems[index]['title'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 2, 55, 109),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
