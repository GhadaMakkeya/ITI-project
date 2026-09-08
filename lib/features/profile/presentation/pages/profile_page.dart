import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey.shade300,
                      child: const Icon(Icons.person, size: 50, color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Radwa Medhat',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    _buildProfileItem(Icons.person_outline, 'Profile'),
                    _buildProfileItem(Icons.settings_outlined, 'Setting'),
                    _buildProfileItem(Icons.mail_outline, 'Contact'),
                    _buildProfileItem(Icons.share_outlined, 'Share App'),
                    _buildProfileItem(Icons.help_outline, 'Help'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Sign Out',
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black87),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}