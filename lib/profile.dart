import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color.fromARGB(255, 2, 55, 109),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // 👈 Go back to HomePage
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            children: [
              // 🧑 Profile Picture Placeholder
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[300],
                child: const Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 20),

              // 📛 Name
              const Text(
                'Yosuf Khan',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              // 🎓 Degree and Semester
              const SizedBox(height: 8),
              const Text(
                'BS IT - 6th Semester',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),

              // 📊 CGPA
              const SizedBox(height: 8),
              const Text(
                'CGPA: 2.8',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),

              const SizedBox(height: 30),

              // 🌐 Social Links Header
              const Text(
                'Connect with me',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 15),

              // 🔗 LinkedIn
              const ProfileLinkButton(
                icon: Icons.link,
                label: 'LinkedIn',
                color: Colors.blue,
                url: 'https://linkedin.com/in/example',
              ),

              const SizedBox(height: 10),

              // 🔗 GitHub
              const ProfileLinkButton(
                icon: Icons.code,
                label: 'GitHub',
                color: Colors.black87,
                url: 'https://github.com/example',
              ),

              const SizedBox(height: 30),

              // ✏️ Edit Profile Button
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Edit feature coming soon ✏️'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                icon: const Icon(Icons.edit),
                label: const Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 2, 55, 109),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 🔘 Reusable button for profile links
class ProfileLinkButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final String url;

  const ProfileLinkButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Opening $label...')));
      },
      icon: Icon(icon, color: Colors.white),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(180, 45),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
