import 'package:flutter/material.dart';
import 'package:meditationapp_task/screens/home/choose_topic.dart';


class WelcomeSleepScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 23, 77, 1),
      body: Stack(
        children: [
          // Background Image
          SizedBox.expand(
            child: Image.asset(
              'assets/images/sleep_screen_bg.png', // replace with your background image
              fit: BoxFit.cover,
            ),
          ),

          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 80,),
                  // Title
                  const Text(
                    'Welcome to Sleep',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 16),

                  // Description
                  const Text(
                    'Explore the new king of sleep. It uses sound\nand visualization to create perfect conditions\nfor refreshing sleep.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),



                  SizedBox(height: 68,),

                  // Birds image

                  Image.asset(
                    'assets/images/sleep_screen_birds.png', // replace with your birds image
                    height: 200,
                  ),
                  const SizedBox(height: 150),


                  Container(
                  // Get Started Button
                  alignment: Alignment.bottomCenter,

                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 22),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(142, 151, 253, 1),
                          foregroundColor: Colors.white,
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
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
