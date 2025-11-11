import 'package:flutter/material.dart';

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample reminders (you can later fetch from DB or local storage)
    final List<Map<String, String>> reminders = [
      {'title': 'AI Quiz', 'date': '24 Nov'},
      {'title': 'Presentation', 'date': '26 Nov'},
      {'title': 'Project Viva', 'date': '30 Nov'},
      {'title': 'Assignment Submission', 'date': '28 Nov'},
      {'title': 'Group Meeting', 'date': '25 Nov'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Reminders')),
      body: reminders.isEmpty
          ? const Center(
              child: Text(
                'No reminders yet!',
                style: TextStyle(color: Colors.white70, fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: reminders.length,
              itemBuilder: (context, index) {
                final reminder = reminders[index];
                return Card(
                  color: const Color.fromARGB(217, 2, 55, 109),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: const Icon(
                      Icons.notifications_active,
                      color: Colors.white,
                      size: 32,
                    ),
                    title: Text(
                      reminder['title']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      reminder['date']!,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white70,
                      size: 16,
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Reminder: ${reminder['title']} on ${reminder['date']}',
                          ),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Add new reminder feature coming soon!'),
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
