import 'package:flutter/material.dart';
import 'package:meditationapp_task/screens/home/choose_topic.dart';
import 'package:meditationapp_task/screens/auth/signin_screen.dart';
import 'package:meditationapp_task/screens/auth/signup_screen.dart';
import 'package:meditationapp_task/screens/auth/silent_moon_app.dart';
import 'package:meditationapp_task/screens/home/course_detail_screen.dart';
import 'package:meditationapp_task/screens/home/home_screen.dart';
import 'package:meditationapp_task/screens/home/reminder_screen.dart';
import 'package:meditationapp_task/screens/home/sleep_screen.dart';
import 'package:meditationapp_task/screens/home/welcome_screen.dart';
import 'package:meditationapp_task/screens/home/welcome_sleep.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // '/': (context) => IntroScreen(),
        '/signin': (context) => SignInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/choose-topic': (context) => ChooseTopicScreen(),
        '/reminder': (context) => ReminderScreen(),
        '/home': (context) => HomeScreen(),
        '/course': (context) => CourseDetailScreen(),
        '/welcomesleep': (context) => WelcomeSleepScreen(),
       // '/sleep': (context) => SleepScreen(),



      },
        home: WelcomeSleepScreen(),
    );
  }
}








