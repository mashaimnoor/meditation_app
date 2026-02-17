import 'package:flutter/material.dart';
import 'package:meditationapp_task/widgets/bottom_nav.dart';
import 'package:meditationapp_task/widgets/course_card.dart';
import 'course_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNav(
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

                Center(
                  child: Text(
                    "Silent Moon",
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 3,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                SizedBox(height: 25),

                Text(
                  "Good Morning, Afsar",
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
                        subtitle: "COURSE",
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
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      recommendedCard("Focus"),
                      SizedBox(width: 15),
                      recommendedCard("Happiness"),
                      SizedBox(width: 15),
                      recommendedCard("Focus"),
                    ],
                  ),
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );


  }

  Widget recommendedCard(String title){
    return Container(
      width: 160,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xffE6E7F2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Container()),

          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          Text(
            "MEDITATION • 3-10 MIN",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}