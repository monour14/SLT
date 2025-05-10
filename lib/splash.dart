import 'package:flutter/material.dart';
import 'dart:async';
import 'welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD2B09E),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40), // Adjust the radius as needed
              child: Image.asset(
                'assets/slt.png',
                width: 314,
                height: 314,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}