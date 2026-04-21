import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Screens
import 'package:meditationapp_task/screens/auth/signin_screen.dart';
import 'package:meditationapp_task/screens/auth/signup_screen.dart';
import 'package:meditationapp_task/screens/home/choose_topic.dart';
import 'package:meditationapp_task/screens/home/course_detail_screen.dart';
import 'package:meditationapp_task/screens/home/home_screen.dart';
import 'package:meditationapp_task/screens/home/reminder_screen.dart';
import 'package:meditationapp_task/screens/home/sleep_detail_screen.dart';
import 'package:meditationapp_task/screens/home/sleep_screen.dart';
import 'package:meditationapp_task/screens/home/welcome_screen.dart';
import 'package:meditationapp_task/screens/home/welcome_sleep.dart';

bool isLoggedIn = false;
bool seenWelcome = false;

Future<void> initPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  seenWelcome = prefs.getBool('seenWelcome') ?? false;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initPrefs(); // 👈 important

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final isAuthRoute =
          state.uri.toString() == '/signin' ||
              state.uri.toString() == '/signup';

      // If welcome not seen
      if (!seenWelcome && state.uri.toString() != '/') {
        return '/';
      }

      // If not logged in
      if (!isLoggedIn && !isAuthRoute) {
        return '/signin';
      }

      // If already logged in
      if (isLoggedIn && isAuthRoute) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(path: '/', builder: (context, state) => WelcomeScreen()),
      GoRoute(path: '/signin', builder: (context, state) => SignInScreen()),
      GoRoute(path: '/signup', builder: (context, state) => SignUpScreen()),
      GoRoute(path: '/choose-topic', builder: (context, state) => ChooseTopicScreen()),
      GoRoute(path: '/reminder', builder: (context, state) => ReminderScreen()),
      GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
      GoRoute(path: '/course', builder: (context, state) => CourseDetailScreen()),
      GoRoute(path: '/welcomesleep', builder: (context, state) => WelcomeSleepScreen()),
      GoRoute(path: '/sleep', builder: (context, state) => SleepScreen()),
      GoRoute(path: '/sleepdetailscreen', builder: (context, state) => SleepDetailScreen()),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}