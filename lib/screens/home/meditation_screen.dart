import 'package:flutter/material.dart';

class MeditateScreen extends StatefulWidget {
  const MeditateScreen({super.key});

  @override
  State<MeditateScreen> createState() => _MeditateScreenState();
}

class _MeditateScreenState extends State<MeditateScreen> {
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
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  Text(
                    "Meditate",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "we can learn how to recognize when our minds are doing their normal everyday acrobatics.",
                    textAlign: .center,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
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

            SizedBox(height: 20),

            Expanded(
              child: Container(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // Daily Calm Card
                    GestureDetector(
                      onTap: () {},
                      child:Container(
                        height: 95,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(241, 221, 207, 1),
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('assets/images/meditation_screen_dtbg.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Daily Calm",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                Text("APR 30 • PAUSE PRACTICE", style: TextStyle(color: Colors.grey[700])),
                              ],
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Icon(Icons.play_arrow, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Grid Cards
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 0.85,
                        children: [
                          meditationCard("7 Days of Calm", Colors.blue[200]!, 'assets/images/7days_calm.png'),
                          meditationCard("Anxiety Release", Colors.orange[300]!, 'assets/images/anxiety_release.png'),
                          meditationCard("Nature Peace", Colors.green[200]!, 'assets/images/nature_peace.png'),
                          meditationCard("Mind Refresh", Colors.yellow[200]!, 'assets/images/mind_refresh.png'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget meditationCard(String title, Color color, String image) {
    return GestureDetector(
      onTap: () {},

      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),

            // Dark Gradient Overlay (for text visibility)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // Title Bottom Left
            Positioned(
              left: 15,
              bottom: 15,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
