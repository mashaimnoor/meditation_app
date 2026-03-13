import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNav({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isSleepScreen = currentIndex == 1;

    BottomNavigationBarItem navItem(String imagePath, String label, int index) {
      bool isSelected = currentIndex == index;

      return BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isSelected
                ? (isSleepScreen
                      ? Colors
                            .white // circle on dark theme
                      : const Color(0xff8E97FD)) // normal theme
                : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            imagePath,
            height: 20,
            color: isSelected
                ? (isSleepScreen ? Colors.black : Colors.white)
                : (isSleepScreen ? Colors.white70 : Colors.grey),
          ),
        ),
        label: label,
      );
    }

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => onTap(index),

      type: BottomNavigationBarType.fixed,

      backgroundColor: isSleepScreen
          ? Color.fromRGBO(3, 23, 77, 1)
          : Colors.white,

      selectedItemColor: isSleepScreen ? Colors.white : const Color(0xff8E97FD),

      unselectedItemColor: isSleepScreen ? Colors.white70 : Colors.grey,

      items: [
        navItem("assets/images/home.png", "Home", 0),
        navItem("assets/images/moon1.png", "Sleep", 1),
        navItem("assets/images/medi.png", "Meditate", 2),
        navItem("assets/images/music1.png", "Music", 3),
        navItem("assets/images/profile.png", "Noor", 4),
      ],
    );
  }
}
