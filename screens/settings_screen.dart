import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _ipController =
      TextEditingController(text: '192.168.1.5'); // default IP

  void _saveIP() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('✅ IP Saved: ${_ipController.text.trim()}')),
    );
  }

  void _reconnectRobot() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('🔄 Reconnecting to robot...')),
    );
  }

  void _clearCache() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('🧹 App cache cleared!')),
    );
  }

  void _sendFeedback() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('📤 Feedback feature coming soon!')),
    );
  }

  void _showAbout() {
    showAboutDialog(
      context: context,
      applicationName: 'RoboControl',
      applicationVersion: '1.0.0',
      applicationLegalese: 'Made with Flutter',
    );
  }

  void _logout() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: TextStyle(color: colorScheme.onPrimary)),
        backgroundColor: colorScheme.primary,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Theme Toggle
          SwitchListTile(
            value: themeProvider.isDarkMode,
            onChanged: (_) => themeProvider.toggleTheme(),
            title: Text('Dark Mode', style: TextStyle(color: colorScheme.onSurface)),
            secondary: Icon(Icons.brightness_6, color: colorScheme.primary),
          ),

          const Divider(),

          // Robot IP Input
          ListTile(
            leading: Icon(Icons.router, color: colorScheme.primary),
            title: Text('Robot IP Address', style: TextStyle(color: colorScheme.onSurface)),
            subtitle: TextField(
              controller: _ipController,
              keyboardType: TextInputType.url,
              style: TextStyle(color: colorScheme.onSurface),
              decoration: InputDecoration(
                hintText: 'Enter IP (e.g. 192.168.1.5)',
                hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: colorScheme.outline),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: colorScheme.primary),
                ),
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.save, color: colorScheme.primary),
              onPressed: _saveIP,
            ),
          ),

          const SizedBox(height: 16),

          // Reconnect
          ListTile(
            leading: Icon(Icons.bluetooth_searching, color: colorScheme.primary),
            title: Text('Reconnect to Robot', style: TextStyle(color: colorScheme.onSurface)),
            onTap: _reconnectRobot,
          ),

          // Clear Cache
          ListTile(
            leading: Icon(Icons.cleaning_services, color: colorScheme.primary),
            title: Text('Clear Cache', style: TextStyle(color: colorScheme.onSurface)),
            onTap: _clearCache,
          ),

          // Send Feedback
          ListTile(
            leading: Icon(Icons.feedback_outlined, color: colorScheme.primary),
            title: Text('Send Feedback', style: TextStyle(color: colorScheme.onSurface)),
            onTap: _sendFeedback,
          ),

          // About
          ListTile(
            leading: Icon(Icons.info_outline, color: colorScheme.primary),
            title: Text('About This App', style: TextStyle(color: colorScheme.onSurface)),
            onTap: _showAbout,
          ),

          const Divider(),

          // Logout
          ListTile(
            leading: Icon(Icons.logout, color: colorScheme.error),
            title: Text(
              'Logout',
              style: TextStyle(color: colorScheme.error, fontWeight: FontWeight.bold),
            ),
            onTap: _logout,
          ),

          const SizedBox(height: 20),

          // Version Info
          Center(
            child: Text(
              'Version 1.0.0 • Built with Flutter',
              style: TextStyle(color: colorScheme.outline),
            ),
          ),
        ],
      ),
    );
  }
}
