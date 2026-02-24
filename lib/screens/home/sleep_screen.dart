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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  children: [
                    Text(
                      "Sleep Stories",
                      style: TextStyle(fontSize: 28, color: Colors.white ,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Soothing brdtime stories to halp you fall \n into a deep and natural sleep",
                      textAlign: .center,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),

              // Tabs
              SizedBox(
                height: 108,
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

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
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
                    GridView.count(
                      crossAxisCount: 2, // 2 columns
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1, // adjust if needed
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(), // if inside another scroll view
                      children: [
                        storyCard("Night Island", "assets/images/night.png", "45 min.Sleep Music"),
                        storyCard("Sweet Sleep", "assets/images/sweet.png", "45 min.Sleep Music"),
                        storyCard("Good night", "assets/images/goodnight.png", "45 min.Sleep Music"),
                        storyCard("Moon clouds", "assets/images/moonclouds.png", "45 min.Sleep Music"),
                      ],
                    )
                    ],
                  )
                ),
               ),
            ],
          ),
       ),
    );
  }

  Widget storyCard(String title, String image, String description) {
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
        ),
        alignment: Alignment.bottomLeft,
        child: Column(
          spacing: 3,
          children: [
            Image.asset(image),
            Align(
              alignment: .centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold
                ),
              ),
            ),
            Align(
              alignment: .centerLeft,
              child: Text(
                description,
                style: const TextStyle(
                    color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}