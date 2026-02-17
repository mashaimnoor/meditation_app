import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final String title =
    ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text("$title Course Screen"),
      ),
    );
  }
}