import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode
          ? ThemeData.dark().copyWith(
              scaffoldBackgroundColor: Colors.grey[900],
            )
          : ThemeData.light().copyWith(
              scaffoldBackgroundColor: const Color(0xFFD2B09E),
            ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          backgroundColor: _isDarkMode ? Colors.grey[850] : Colors.brown,
        ),
        body: ListView(
          children: [
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: _isDarkMode,
              onChanged: (val) {
                setState(() {
                  _isDarkMode = val;
                });
              },
              secondary: const Icon(Icons.dark_mode),
            ),
            // Add more settings here
          ],
        ),
      ),
    );
  }
}
