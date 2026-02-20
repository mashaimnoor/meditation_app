import 'package:flutter/material.dart';
import 'package:meditationapp_task/screens/home/sleep_detail_screen.dart';


class SleepScreen extends StatefulWidget {
  const SleepScreen({super.key});

  @override
  State<SleepScreen> createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {
  int selectedTab = 0;
  final List<String> tabs = ["All", "My", "Anxious", "Sleep", "Kids"];
  final List<IconData> tabIcons = [
    Icons.all_inclusive,
    Icons.favorite_border,
    Icons.sentiment_dissatisfied,
    Icons.nightlight_round,
    Icons.child_care,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 23, 77, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              /// Header
              const Text(
                "Sleep Stories",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Soothing bedtime stories to help you fall\ninto a deep and natural sleep",
                textAlign: .center,
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 12),

              // Tabs
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tabs.length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedTab == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = index;
                        });
                      },

                      child: Column(
                        mainAxisAlignment: .center,
                        crossAxisAlignment: .center,

                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            padding: EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: isSelected ? Color.fromRGBO(142, 151, 253, 1) : Color.fromRGBO(160, 163, 177, 1),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Icon(tabIcons[index], size: 28, color: Colors.white),
                          ),

                          SizedBox(height: 8),

                          Text(
                            tabs[index],
                            textAlign: .center,
                            style: TextStyle(
                                color: Color.fromRGBO(160, 163, 177, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),


              const SizedBox(height: 25),

              /// Main Big Card
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SleepDetailScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/ocean.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              /// Small Cards
              Row(
                children: [
                  Expanded(
                    child: storyCard(
                        "Night Island", "assets/images/night.png"),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: storyCard(
                        "Sweet Sleep", "assets/images/sweet.png"),
                  ),
                ],
              ),
              SizedBox(height: 71 ,),
              Row(
                children: [
                  Expanded(
                    child: storyCard(
                        "Night Island", "assets/images/goodnight.png"),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: storyCard(
                        "Sweet Sleep", "assets/images/moonclouds.png"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget storyCard(String title, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const SleepDetailScreen(

            ),
          ),
        );
      },
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}