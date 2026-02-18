import 'package:flutter/material.dart';
import 'package:meditationapp_task/screens/home/meditation_screen.dart';
import 'package:meditationapp_task/widgets/bottom_nav.dart';
import 'package:meditationapp_task/widgets/course_card.dart';
// import 'course_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;

  final List<Widget> screens = [
    Center(child: Text("Home Screen")),      // Home
    Center(child: Text("Sleep Screen")),     // Sleep
    MeditateScreen(),                         // Meditate
    Center(child: Text("Music Screen")),     // Music
    Center(child: Text("Profile Screen")),   // Profile
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 20),

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

                SizedBox(height: 25),

                Text(
                  "Good Morning, Noor",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  "We Wish you have a good day",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),

                SizedBox(height: 25),

                Row(
                  children: [
                    Expanded(
                      child: CourseCard(
                        title: "Basics",
                        subtitle: "COURSE",
                        duration: "3-10 MIN",
                        image: ('assets/images/bas.png'),
                        color: Color(0xff8E97FD),
                        buttonColor: Colors.white,
                        textColor: Colors.white,
                        onTap: (){
                          Navigator.pushNamed(
                            context,
                            '/course',
                            arguments: "Basics",
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 15),

                    Expanded(
                      child: CourseCard(
                        title: "Relaxation",
                        subtitle: "MUSIC",
                        duration: "3-10 MIN",
                        image: ('assets/images/rel.png'),
                        color: Color.fromRGBO(255, 201, 126, 1),
                        buttonColor: Colors.white,
                        textColor: Colors.white,
                        onTap: (){
                          Navigator.pushNamed(
                            context,
                            '/course',
                            arguments: "Relaxation",
                          );
                        },
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 25),

                Container(
                  height: 95,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xff333242),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: AssetImage('assets/images/dailythoughts.png'))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Daily Thought",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "MEDITATION • 3-10 MIN",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.play_arrow, color: Colors.black),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 30),

                Text(
                  "Recommended for you",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                SizedBox(
                  height: 185,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      recommendedCard("Focus", 'assets/images/focus.png' ),
                      SizedBox(width: 15),
                      recommendedCard("Happiness", 'assets/images/happiness.png'),
                      SizedBox(width: 15),
                      recommendedCard("Focus", 'assets/images/focus.png'),

                    ],
                  ),
                ),

                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );


  }

  Widget recommendedCard(String title, String image) {
    return Container(
      width: 162,
      margin: EdgeInsets.only(right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          Container(
            height: 113,
            decoration: BoxDecoration(
              color: Color.fromRGBO(132, 219, 199, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              //width: double.infinity,
            ),
          ),

          SizedBox(height: 10),

          // Title
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          SizedBox(height: 4),

          // Subtitle
          Text(
            "MEDITATION • 3-10 MIN",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}