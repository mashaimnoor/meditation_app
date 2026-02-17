import 'package:flutter/material.dart';

class ChooseTopicScreen extends StatelessWidget {
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
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.85,
                children: [

                  topicCard("Reduce Stress", Color.fromRGBO(128, 138, 255, 1) , 'assets/images/stress.png', 230),
                  topicCard("Improve Performance", Color.fromRGBO(250, 110, 90, 1), 'assets/images/improveperf.png', 167),
                  topicCard("Increase Happiness", Color.fromRGBO(254, 177, 143, 1),'assets/images/inchpp.png', 167),
                  topicCard("Reduce Anxiety", Color.fromRGBO(255, 207, 134, 1),'assets/images/redanx.png', 210),
                  topicCard("Personal Growth",Color.fromRGBO(108, 178, 142, 1), 'assets/images/prsgr.png', 210),
                  topicCard("Better Sleep", Color.fromRGBO(63, 65, 78, 1), 'assets/images/slp.png', 167),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget topicCard(String title, Color color, String image , int height) {

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(image)),
      ),
      padding: EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}