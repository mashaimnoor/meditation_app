import 'package:flutter/material.dart';
import 'package:meditationapp_task/screens/home/meditation_screen.dart';
import 'package:meditationapp_task/screens/home/sleep_screen.dart';
import 'package:meditationapp_task/widgets/bottom_nav.dart';
import 'package:meditationapp_task/widgets/home_content.dart';
// import 'course_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;

  final List<Widget> screens = [
    HomeContent(),     // Home
    //SleepScreen(),    // Sleep
    MeditateScreen(),                         // Meditate
    Center(child: Text("Music Screen")),     // Music
    Center(child: Text("Profile Screen")),   // Profile
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

