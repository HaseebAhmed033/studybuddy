import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> noteFolders = [
      {'title': 'Programming', 'icon': Icons.code},
      {'title': 'Computer Networks', 'icon': Icons.router},
      {'title': 'Cyber Security', 'icon': Icons.security},
      {'title': 'AI / ML', 'icon': Icons.smart_toy},
      {'title': 'Other Notes', 'icon': Icons.notes},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: noteFolders.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final folder = noteFolders[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        FolderDetailScreen(folderName: folder['title']),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(217, 2, 55, 109),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 6,
                      offset: const Offset(2, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(folder['icon'], size: 48, color: Colors.white),
                    const SizedBox(height: 10),
                    Text(
                      folder['title'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Add new note feature coming soon!')),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class FolderDetailScreen extends StatelessWidget {
  final String folderName;
  const FolderDetailScreen({super.key, required this.folderName});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<String>> notesData = {
      'Programming': ['C++ Basics', 'OOP Concepts', 'Data Structures'],
      'Computer Networks': ['OSI Model', 'IP Addressing', 'TCP vs UDP'],
      'Cyber Security': ['Phishing Detection', 'Firewalls', 'Encryption'],
      'AI / ML': ['Neural Networks', 'KNN Algorithm', 'TF-IDF Notes'],
      'Other Notes': ['Study Plan', 'To-Do List', 'Random Ideas'],
    };

    final notes = notesData[folderName] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(folderName)),
      body: notes.isEmpty
          ? const Center(
              child: Text(
                'No notes yet!',
                style: TextStyle(color: Colors.white70, fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Card(
                  color: const Color.fromARGB(255, 3, 65, 128),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Text(
                      notes[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
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
                          content: Text('Opening "${notes[index]}"...'),
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
            SnackBar(
              content: Text('Add note to "$folderName" feature coming soon!'),
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
