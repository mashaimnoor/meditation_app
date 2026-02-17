import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meditationapp_task/screens/home/reminder_screen.dart';

class ChooseTopicScreen extends StatelessWidget {

  final List<int> heights = [230, 167, 200, 210, 180, 167];

  final List<Map<String, dynamic>> topics = [
    {
      "title": "Reduce Stress",
      "color": Color.fromRGBO(128, 138, 255, 1),
      "image": "assets/images/stress.png",
      "height": 146.0,
    },
    {
      "title": "Improve Performance",
      "color": Color.fromRGBO(250, 110, 90, 1),
      "image": "assets/images/improveperf.png",
      "height": 85.0,
    },
    {
      "title": "Increase Happiness",
      "color": Color.fromRGBO(254, 177, 143, 1),
      "image": "assets/images/inchpp.png",
      "height": 98.0,
    },
    {
      "title": "Reduce Anxiety",
      "color": Color.fromRGBO(255, 207, 134, 1),
      "image": "assets/images/redanx.png",
      "height": 117.0,
    },
    {
      "title": "Personal Growth",
      "color": Color.fromRGBO(108, 178, 142, 1),
      "image": "assets/images/prsgr.png",
      "height": 114.0,
    },
    {
      "title": "Better Sleep",
      "color": Color.fromRGBO(63, 65, 78, 1),
      "image": "assets/images/slp.png",
      "height": 86.0,
    },
  ];

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Choose Topic"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 10),

            Text(
              "What Brings you\nto Silent Moon?",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 8),

            Text(
              "choose a topic to focus on:",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 20),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                    children: List.generate(topics.length, (index) {
                      final topic = topics[index];

                      return StaggeredGridTile.fit(
                        crossAxisCellCount: 1,
                        child: topicCard(
                          topic["title"],
                          topic["color"],
                          topic["image"],
                          topic["height"],
                          context,
                        ),
                      );
                    }
                  ),
                ),
              )
            ),
          ]
        )
      )
    );
  }

  Widget topicCard(String title, Color color, String image, double height, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReminderScreen(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: .spaceBetween,
          children:[
            Image.asset(image, height: height,),
            Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]
      ),
    ),
  );
  }
}
