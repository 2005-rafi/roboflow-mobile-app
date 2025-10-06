import 'package:flutter/material.dart';

class CameraFeedScreen extends StatefulWidget {
  const CameraFeedScreen({super.key});

  @override
  State<CameraFeedScreen> createState() => _CameraFeedScreenState();
}

class _CameraFeedScreenState extends State<CameraFeedScreen> {
  bool _isFullscreen = false;
  bool _isLoading = true;
  bool _streamFailed = false;

  final String _cameraUrl = 'http://your-robot-ip/stream'; // Replace later

  void _refreshFeed() {
    setState(() {
      _isLoading = true;
      _streamFailed = false;
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _streamFailed = false;
      });
    });
  }

  void _toggleFullscreen() {
    setState(() => _isFullscreen = !_isFullscreen);
  }

  void _takeSnapshot() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('📸 Snapshot saved (coming soon)')),
    );
  }

  void _switchCamera() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('🔁 Switched camera (UI only)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Camera Feed',
          style: TextStyle(color: colorScheme.onPrimary),
        ),
        backgroundColor: colorScheme.primary,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Camera feed container
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: colorScheme.primary),
                      color: colorScheme.surfaceContainerHighest,
                    ),
                    child:
                        _isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : _streamFailed
                            ? Text(
                              '⚠️ Stream failed',
                              style: TextStyle(
                                color: colorScheme.error,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            )
                            : ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                _cameraUrl,
                                fit: BoxFit.cover,
                                loadingBuilder: (
                                  context,
                                  child,
                                  loadingProgress,
                                ) {
                                  if (loadingProgress == null) return child;
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  if (!_streamFailed) {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                          if (mounted) {
                                            setState(() {
                                              _streamFailed = true;
                                              _isLoading = false;
                                            });
                                          }
                                        });
                                  }
                                  return Center(
                                    child: Text(
                                      '🚫 Unable to load camera',
                                      style: TextStyle(
                                        color: colorScheme.error,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                  ),
                  if (_isFullscreen)
                    Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(0.4),
                        alignment: Alignment.center,
                        child: const Text(
                          '📺 Fullscreen Mode',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Top Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton.icon(
                  icon: const Icon(Icons.refresh),
                  label: const Text('Refresh'),
                  onPressed: _refreshFeed,
                ),
                OutlinedButton.icon(
                  icon: const Icon(Icons.fullscreen),
                  label: Text(_isFullscreen ? 'Exit Fullscreen' : 'Fullscreen'),
                  onPressed: _toggleFullscreen,
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Secondary actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Snapshot'),
                  onPressed: _takeSnapshot,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                  ),
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.switch_camera),
                  label: const Text('Switch Cam'),
                  onPressed: _switchCamera,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.secondary,
                    foregroundColor: colorScheme.onSecondary,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Back button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to Control'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/robot-control');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
