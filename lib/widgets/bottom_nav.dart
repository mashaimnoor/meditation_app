import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNav({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    BottomNavigationBarItem navItem(
        String imagePath, String label, int index) {
      return BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: currentIndex == index
                ? const Color(0xff8E97FD)
                : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            imagePath,
            height: 20,
            color: currentIndex == index
                ? Colors.white
                : Colors.grey,
          ),
        ),
        label: label,
      );
    }

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xff8E97FD),
      unselectedItemColor: Colors.grey,
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
