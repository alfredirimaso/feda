import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});


  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;

  void _toggleNotifications(bool value) {
    setState(() {
      _notificationsEnabled = value;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _notificationsEnabled
              ? "Notifications Enabled"
              : "Notifications Disabled",
        ),
      ),
    );
  }

  void _logout() {
    // Placeholder logout functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Logging out...")),
    );

    // Future: Clear user session and redirect to Login Page
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            "Settings",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Notification toggle
          SwitchListTile(
            title: const Text("Reminders & Notifications"),
            value: _notificationsEnabled,
            activeColor: Colors.green,
            onChanged: _toggleNotifications,
          ),
          const Divider(),

          // Edit profile
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Edit Profile"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Future: navigate to profile editing page
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Edit profile coming soon")),
              );
            },
          ),
          const Divider(),

          // Logout
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout"),
            onTap: _logout,
          ),
        ],
      ),
    );
  }
}
