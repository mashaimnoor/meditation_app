import 'package:flutter/material.dart';
import 'package:meditationapp_task/widgets/bottom_nav.dart';


class MeditateScreen extends StatefulWidget {
  const MeditateScreen({super.key});

  @override
  State<MeditateScreen> createState() => _MeditateScreenState();
}

class _MeditateScreenState extends State<MeditateScreen> {
  int selectedTab = 0;
  int currentIndex = 2; // ✅ mutable, not a getter

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
        bottomNavigationBar: BottomNav(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index; // ✅ now it works
            });
          },
        ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Meditate",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "we can learn how to recognize when our minds are doing their normal everyday acrobatics.",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              SizedBox(height: 20),
              // Tabs
              SizedBox(
                height: 60,
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
                      child: Container(
                        margin: EdgeInsets.only(right: 15),
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.deepPurple[300] : Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Icon(tabIcons[index], color: isSelected ? Colors.white : Colors.grey[700]),
                            SizedBox(width: 5),
                            Text(
                              tabs[index],
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.grey[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              // Daily Calm Card
              GestureDetector(
                onTap: () {
                  // Navigate to detailed meditation
                  Navigator.push(context, MaterialPageRoute(builder: (_) => MeditationDetailScreen(title: "Daily Calm")));
                },
                child: Container(
                  height: 90,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    borderRadius: BorderRadius.circular(20),
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
                        backgroundColor: Colors.deepPurple,
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
                    meditationCard("7 Days of Calm", Colors.blue[200]!),
                    meditationCard("Anxiety Release", Colors.orange[300]!),
                    meditationCard("Nature Peace", Colors.green[200]!),
                    meditationCard("Mind Refresh", Colors.yellow[200]!),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget meditationCard(String title, Color color) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => MeditationDetailScreen(title: title)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.all(15),
        child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}

// -------------------- Meditation Detail Screen --------------------
class MeditationDetailScreen extends StatelessWidget {
  final String title;
  const MeditationDetailScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text("Meditation details for $title"),
      ),
    );
  }
}
