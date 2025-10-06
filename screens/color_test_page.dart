import 'package:flutter/material.dart';
import 'package:learning/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        title: Text(
          "Home Page",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        toolbarHeight: 75,
        titleTextStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                themeProvider.toggleTheme();
              },
              child: Icon(
                themeProvider.isDarkMode
                    ? Icons.dark_mode_sharp
                    : Icons.light_mode_sharp,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 25),
            Container(
              height: 100,
              alignment: Alignment.center,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                "Primary",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              height: 100,
              alignment: Alignment.center,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Text(
                "Primary Container",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              height: 100,
              alignment: Alignment.center,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Text(
                "Secondary",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              height: 100,
              alignment: Alignment.center,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
              child: Text(
                "Secondary Container",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              height: 100,
              alignment: Alignment.center,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.tertiary,
              ),
              child: Text(
                "Tertiary",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onTertiary,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              alignment: Alignment.center,
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.tertiaryContainer,
              ),
              child: Text(
                "Tertiary Container",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
