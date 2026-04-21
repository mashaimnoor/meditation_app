import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 🔹 tum apni app state yahan se use kar rahi ho
bool seenWelcome = false;
bool isLoggedIn = false;

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
      if (!mounted) return; // IMPORTANT FIX

      context.go('/moonapp');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7faddf),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // 🔹 Logo
            Icon(
              Icons.self_improvement,
              size: 90,
              color: Colors.white,
            ),

            const SizedBox(height: 20),

            // 🔹 App Name
            Row(
              mainAxisAlignment: .center,
              spacing: 8,
              children: [
                Text(
                  "Silent",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Image.asset('assets/images/img_1.png', width: 22),
                Text(
                  "Moon",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 10),

            const Text(
              "Relax • Focus • Heal",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 30),

            // 🔹 Loader
            const CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}