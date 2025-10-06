import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: colorScheme.onPrimary)),
        backgroundColor: colorScheme.primary,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // Greeting
            Text(
              '👋 Hi, RoboPilot',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Welcome back! Ready to control your robot?',
              style: TextStyle(color: colorScheme.onSurface),
            ),

            const SizedBox(height: 24),

            // Status Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: ListTile(
                leading: Icon(
                  Icons.bluetooth_connected,
                  color: colorScheme.primary,
                ),
                title: const Text('Robot Status'),
                subtitle: const Text('🟢 Connected'),
                trailing: IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    // TODO: Implement refresh status
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Control Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/robot-control');
                    },
                    icon: const Icon(Icons.videogame_asset),
                    label: const Text('Control Robot'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/camera');
                    },
                    icon: const Icon(Icons.videocam),
                    label: const Text('View Camera'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: colorScheme.secondary,
                      foregroundColor: colorScheme.onSecondary,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Sensor Info Section (Optional)
            Text(
              '📡 Sensor Data',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _sensorCard(context, 'Temperature', '23°C', Icons.thermostat),
                const SizedBox(width: 16),
                _sensorCard(context, 'Distance', '14 cm', Icons.straighten),
              ],
            ),

            const SizedBox(height: 40),

            // Settings and Logout
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton.icon(
                  icon: const Icon(Icons.settings),
                  label: const Text('Settings'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
                OutlinedButton.icon(
                  icon: const Icon(Icons.logout),
                  label: const Text('Logout'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _sensorCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(icon, size: 30, color: colorScheme.primary),
              const SizedBox(height: 10),
              Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
