import 'package:flutter/material.dart';
import 'package:meditationapp_task/screens/home/choose_topic.dart';
import 'package:meditationapp_task/screens/auth/signin_screen.dart';
import 'package:meditationapp_task/screens/auth/signup_screen.dart';
import 'package:meditationapp_task/screens/auth/silent_moon_app.dart';
import 'package:meditationapp_task/screens/home/welcome_screen.dart';

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
        //'/reminder': (context) => ReminderScreen(),
      },
        home: IntroScreen(),
    );
  }
}








