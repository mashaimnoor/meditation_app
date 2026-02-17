import 'package:flutter/material.dart';
import 'package:meditationapp_task/screens/home/choose_topic.dart';

void main() {
  runApp(WelcomeScreen());
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(133, 137, 235, 1),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Spacer(),
            Row(
              mainAxisAlignment: .center,
              spacing: 8,
              children: [
                Text(
                  "Silent",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Image.asset('assets/images/img_1.png', width: 22,),
                Text(
                  "Moon",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 60),
            Text(
              "Hi! Noor Welcome",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "To Silent Moon",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 1),
            Text(
              "Explore the app and find peace of mind.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 40,),

            Container(
              width: double.infinity,
              height: 600,
              padding: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/welpgbg.png'),
                  fit: .cover,
                ),
              ),

              alignment: Alignment.bottomCenter,

              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 22),
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.indigo,
                  minimumSize: Size(double.infinity, 55)
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ChooseTopicScreen()));
                },
                child: Text("GET STARTED"),
              ),
            ),
            ),
            //Spacer(),
          ],
        ),
      )
    );
  }
}
