import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {

  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xff8E97FD),
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.nightlight_round), label: "Sleep"),
        BottomNavigationBarItem(icon: Icon(Icons.self_improvement), label: "Meditate"),
        BottomNavigationBarItem(icon: Icon(Icons.music_note), label: "Music"),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Afsar"),
      ],
    );
  }
}