import 'package:flutter/material.dart';

class RobotControlScreen extends StatelessWidget {
  const RobotControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Robot Control',
          style: TextStyle(color: colorScheme.onPrimary),
        ),
        backgroundColor: colorScheme.primary,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Live Camera Feed Placeholder
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: colorScheme.surfaceContainerHighest,
                border: Border.all(color: colorScheme.primary),
              ),
              child: Center(
                child: Text(
                  '📷 Live Camera Feed',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Directional Control Buttons
            Column(
              children: [
                _buildControlButtonRow(
                  context,
                  center: _controlButton(
                    context,
                    Icons.arrow_upward,
                    'forward',
                  ),
                ),
                _buildControlButtonRow(
                  context,
                  left: _controlButton(context, Icons.arrow_back, 'left'),
                  center: _controlButton(
                    context,
                    Icons.stop_circle,
                    'stop',
                    isStop: true,
                  ),
                  right: _controlButton(context, Icons.arrow_forward, 'right'),
                ),
                _buildControlButtonRow(
                  context,
                  center: _controlButton(
                    context,
                    Icons.arrow_downward,
                    'backward',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Status and Sensor Data
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _statusChip(context, '🟢 Connected'),
                _statusChip(context, 'Temp: 24°C'),
                _statusChip(context, 'Dist: 15 cm'),
              ],
            ),

            const Spacer(),

            // Emergency Stop and Settings
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.warning_amber),
                  label: const Text('Emergency Stop'),
                  onPressed: () {
                    // TODO: Trigger stop command
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.error,
                    foregroundColor: colorScheme.onError,
                    minimumSize: const Size(160, 50),
                  ),
                ),
                OutlinedButton.icon(
                  icon: const Icon(Icons.settings),
                  label: const Text('Settings'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _controlButton(
    BuildContext context,
    IconData icon,
    String label, {
    bool isStop = false,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      onPressed: () {
        // TODO: Send command to robot: $label
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
        backgroundColor: isStop ? colorScheme.error : colorScheme.primary,
        foregroundColor: isStop ? colorScheme.onError : colorScheme.onPrimary,
      ),
      child: Icon(icon, size: 32),
    );
  }

  Widget _buildControlButtonRow(
    BuildContext context, {
    Widget? left,
    required Widget center,
    Widget? right,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          left ?? const SizedBox(width: 80),
          const SizedBox(width: 16),
          center,
          const SizedBox(width: 16),
          right ?? const SizedBox(width: 80),
        ],
      ),
    );
  }

  Widget _statusChip(BuildContext context, String label) {
    final colorScheme = Theme.of(context).colorScheme;

    return Chip(
      label: Text(label),
      backgroundColor: colorScheme.primaryContainer,
      labelStyle: TextStyle(color: colorScheme.onPrimaryContainer),
    );
  }
}
