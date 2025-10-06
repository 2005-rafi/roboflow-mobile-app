import 'package:flutter/material.dart';
import 'package:learning/screens/camera_feed_screen.dart';
import 'package:learning/screens/robot_control_screen.dart';
import 'package:learning/screens/settings_screen.dart';
import 'package:provider/provider.dart';
import 'package:learning/provider/theme_provider.dart';
import 'package:learning/screens/splash_screen.dart';
import 'package:learning/screens/login_screen.dart';
import 'package:learning/screens/signup_screen.dart';
import 'package:learning/screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'RoboControl',
          theme: themeProvider.getTheme(), 
          darkTheme: themeProvider.getTheme(), 
          themeMode: themeProvider.themeMode, 
          initialRoute: '/splash',
          routes: {
            '/splash': (context) => const SplashScreen(),
            '/login': (context) => const LoginScreen(),
            '/signup': (context) => const SignupScreen(),
            '/home': (context) => const HomeScreen(),
            '/robot-control': (context) => const RobotControlScreen(),
            '/camera': (context) => const CameraFeedScreen(),
            '/settings': (context) => const SettingsScreen(),
          },
        );
      },
    );
  }
}
