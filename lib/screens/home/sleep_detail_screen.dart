import 'package:flutter/material.dart';
import 'package:meditationapp_task/widgets/sleep_player_screen.dart';

class SleepDetailScreen extends StatefulWidget {
  const SleepDetailScreen({super.key});

  @override
  State<SleepDetailScreen> createState() => _SleepDetailScreenState();
}

class _SleepDetailScreenState extends State<SleepDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 23, 77, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top Image with back button
              Stack(
                children: [
                  Container(
                    height: 280,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/night.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.white24,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.white24,
                      child: IconButton(
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),

              /// Title and Description
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Night Island",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "45 MIN • SLEEP MUSIC",
                      style: TextStyle(color: Colors.white54),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Ease the mind into a restful night’s sleep with these deep, ambient tones.",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              /// Heart and Headphone Stats
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: const [
                    Icon(Icons.favorite, color: Colors.white54, size: 18),
                    SizedBox(width: 5),
                    Text(
                      "24.234 Favorites",
                      style: TextStyle(color: Colors.white54),
                    ),
                    SizedBox(width: 20),
                    Icon(Icons.headset, color: Colors.white54, size: 18),
                    SizedBox(width: 5),
                    Text(
                      "34.234 Listening",
                      style: TextStyle(color: Colors.white54),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),

              /// Related Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  "Related",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/moonclouds.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [Colors.black26, Colors.black12],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),

                          child: const Text(
                            "Moon Clouds\n45 MIN • SLEEP MUSIC",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/sweet.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [Colors.black26, Colors.black12],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          child: const Text(
                            "Sweet Sleep\n45 MIN • SLEEP MUSIC",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// Play Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SleepPlayerScreen(
                          title: "Night island", // the title you want to show
                          url:
                              "https://www.example.com/audio.mp3", // the audio URL
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF8E97FD), Color(0xFF6F7BF7)],
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "PLAY",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
