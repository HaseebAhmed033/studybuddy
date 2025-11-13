import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> gridItems = [
      {'title': 'Profile', 'icon': Icons.person, 'route': '/profile'},
      {
        'title': 'Reminders',
        'icon': Icons.notifications,
        'route': '/reminders',
      },
      {'title': 'Notes', 'icon': Icons.note, 'route': '/notes'},
      {'title': 'AI Buddy Chat', 'icon': Icons.chat, 'route': '/aichat'},
      {
        'title': 'Timetable',
        'icon': Icons.calendar_today,
        'route': '/timetable',
      },
      {
        'title': 'Quotes of the Day',
        'icon': Icons.format_quote,
        'route': '/quotes',
      },
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
            final item = gridItems[index];
            return GestureDetector(
              onTap: () {
                // if the route exists, navigate
                if (item['route'] != null) {
                  Navigator.pushNamed(context, item['route']);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${item['title']} screen not added yet! 😅',
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item['icon'], size: 50, color: Colors.blue[900]),
                    const SizedBox(height: 10),
                    Text(
                      item['title'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 2, 55, 109),
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
